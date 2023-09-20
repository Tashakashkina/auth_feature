import 'package:auth_feature/feature/domain/entities/auth_feature.dart';

class AuthFeatureModel extends AuthFeature {
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
