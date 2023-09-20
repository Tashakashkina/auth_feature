import 'package:equatable/equatable.dart';

class AuthFeature extends Equatable {
  final int token;

  const AuthFeature({
    required this.token,
  });

  @override
  List<Object> get props => [token];
}
