import 'package:equatable/equatable.dart';

class AuthFeature extends Equatable {
  final int phoneNumber;
  final int code;

  const AuthFeature({
    required this.phoneNumber,
    required this.code,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
