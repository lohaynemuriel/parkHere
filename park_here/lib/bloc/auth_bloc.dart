import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  AuthBloc(this._firebaseAuth, this._firestore) : super(AuthInitial()) {
    on<SignUpRequested>(_onSignUpRequested);
    on<SignInRequested>(_onSignInRequested);
    on<LoadUserProfile>(_onLoadUserProfile);
    on<UpdateUserProfile>(_onUpdateUserProfile);
  }

  Future<void> _onSignUpRequested(
      SignUpRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      // Salvar dados adicionais no Firestore
      await _firestore.collection('pessoas').doc(userCredential.user?.uid).set({
        'nome': event.nome,
        'telefone': '',
        'email': event.email,
        'dataNascimento': '',
        'cnh': event.cnh,
        'cpf': event.cpf,
      });

      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(e.message ?? "Erro desconhecido."));
    }
  }

  Future<void> _onSignInRequested(
      SignInRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(e.message ?? "Erro desconhecido."));
    }
  }

  Future<void> _onLoadUserProfile(
      LoadUserProfile event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        final userDoc =
            await _firestore.collection('pessoas').doc(user.uid).get();
        final userData = userDoc.data();

        if (userData != null) {
          emit(UserProfileLoaded(
            nome: userData['nome'] ?? '',
            celular: userData['telefone'] ?? '',
            email: user.email ?? '',
            dataNascimento: userData['dataNascimento'] ?? '',
            cnh: userData['cnh'] ?? '',
            cpf: userData['cpf'] ?? '',
          ));
        } else {
          emit(AuthFailure("Dados do usuário não encontrados."));
        }
      } else {
        emit(AuthFailure("Usuário não autenticado."));
      }
    } catch (e) {
      emit(AuthFailure("Erro ao carregar perfil: $e"));
    }
  }

  Future<void> _onUpdateUserProfile(
      UpdateUserProfile event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        // Atualizar no Firestore
        await _firestore.collection('pessoas').doc(user.uid).update({
          'nome': event.nome,
          'telefone': event.celular,
          'email': event.email,
        });

        // Atualizar email no Firebase Authentication
        if (event.email != user.email) {
          await user.verifyBeforeUpdateEmail(event.email);
        }

        // Atualizar senha no Firebase Authentication
        if (event.senha.isNotEmpty) {
          await user.updatePassword(event.senha);
        }

        emit(AuthSuccess());
      } else {
        emit(AuthFailure("Usuário não autenticado."));
      }
    } catch (e) {
      emit(AuthFailure("Erro ao atualizar perfil: $e"));
    }
  }
}
