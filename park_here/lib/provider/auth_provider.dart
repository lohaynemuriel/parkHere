import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthProvider {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  AuthProvider({required this.firebaseAuth, required this.firestore});

  Future<User?> signup({
    required String email,
    required String password,
    required Map<String, dynamic> userData,
  }) async {
    try {
      // Criar usuário no Firebase Auth
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Salvar dados no Firestore
      await firestore
          .collection('pessoas')
          .doc(userCredential.user?.uid)
          .set(userData);

      return userCredential.user;
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> signin({
    required String email,
    required String password,
  }) async {
    try {
      // Login no Firebase Auth
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signout() async {
    await firebaseAuth.signOut();
  }

  User? getCurrentUser() {
    return firebaseAuth.currentUser;
  }
}
