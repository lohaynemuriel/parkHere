// Eventos
import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoadUserProfile extends AuthEvent {}

class SignUpRequested extends AuthEvent {
  final String email;
  final String password;
  final String nome;
  final String cpf;
  final String dataNascimento;
  final String cnh;
  final String telefone;

  SignUpRequested(this.email, this.password, this.nome, this.cpf,
      this.dataNascimento, this.cnh, this.telefone);
}

class SignInRequested extends AuthEvent {
  final String email;
  final String password;

  const SignInRequested(this.email, this.password);
}

class UpdateUserProfile extends AuthEvent {
  final String nome;
  final String celular;
  final String email;
  final String senha;

  UpdateUserProfile({
    required this.nome,
    required this.celular,
    required this.email,
    required this.senha,
  });

  @override
  List<Object> get props => [nome, celular, email, senha];
}
