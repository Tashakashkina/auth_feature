part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class GetTokenEvent extends AuthEvent {
  final String token;

  GetTokenEvent({required this.token});
}
