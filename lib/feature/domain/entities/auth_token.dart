import 'package:equatable/equatable.dart';

class AuthToken extends Equatable {
  final int token;

  const AuthToken({
    required this.token,
  });

  @override
  List<Object> get props => [token];
}
