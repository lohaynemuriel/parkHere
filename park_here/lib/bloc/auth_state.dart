// Estados
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthFailure extends AuthState {
  final String message;

  const AuthFailure(this.message);

  @override
  List<Object> get props => [message];
}

class UserProfileLoaded extends AuthState {
  final String nome;
  final String celular;
  final String email;
  final String dataNascimento;
  final String cnh;
  final String cpf;

  const UserProfileLoaded({
    required this.nome,
    required this.celular,
    required this.email,
    required this.dataNascimento,
    required this.cnh,
    required this.cpf,
  });

  @override
  List<Object> get props => [nome, celular, email, dataNascimento, cnh, cpf];
}
