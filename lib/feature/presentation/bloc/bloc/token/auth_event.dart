part of 'auth_bloc.dart';

class AuthTokenEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class GetTokenFromStorage extends AuthTokenEvent {}

final class GetTokenFromFirebase extends AuthTokenEvent {
  final String email;
  final String password;

  GetTokenFromFirebase({required this.email, required this.password});
}

final class CheckAuthToken extends AuthTokenEvent {}

final class ClearTokenStorage extends AuthTokenEvent {}
