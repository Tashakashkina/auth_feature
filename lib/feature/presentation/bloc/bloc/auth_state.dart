part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthCompleted extends AuthState {}

final class AuthNotCompleted extends AuthState {}

final class AuthGetToken extends AuthState {}

final class AuthError extends AuthState {
  String? error;
  AuthError(this.error);
}
