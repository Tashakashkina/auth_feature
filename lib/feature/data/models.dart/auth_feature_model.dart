import 'package:auth_feature/feature/domain/entities/auth_feature.dart';

class AuthFeatureModel extends AuthFeature {
  const AuthFeatureModel({
    required int phoneNumber,
    required int code,
  }) : super(phoneNumber: phoneNumber, code: code);
}
