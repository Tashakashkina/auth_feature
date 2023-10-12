import 'package:auth_feature/feature/domain/entities/auth_token.dart';

class AuthFeatureModel extends AuthToken {
  const AuthFeatureModel({
    required int token,
  }) : super(token: token);

  factory AuthFeatureModel.fromJson(Map<String, dynamic> json) {
    return AuthFeatureModel(
      token: (json['token']).toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }
}
