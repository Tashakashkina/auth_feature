part of 'auth_bloc.dart';

class AuthTokenEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class GetTokenFromStorage extends AuthTokenEvent {
  final String tokenString;

  GetTokenFromStorage(this.tokenString) : super();
}

final class GetTokenFromFirebase extends AuthTokenEvent {
  final String tokenString;

  GetTokenFromFirebase(this.tokenString) : super();
}

final class CheckAuthToken extends AuthTokenEvent {}
