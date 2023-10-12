part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthChecking extends AuthState {}

final class AuthCompleted extends AuthState {}

final class AuthNotCompleted extends AuthState {}

final class AuthGetToken extends AuthState {}

final class AuthError extends AuthState {
  final String error;
  const AuthError(this.error);
}
