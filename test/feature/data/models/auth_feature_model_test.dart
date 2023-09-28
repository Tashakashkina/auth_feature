import 'package:auth_feature/feature/data/models.dart/auth_feature_model.dart';
import 'package:auth_feature/feature/domain/entities/auth_token.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tAuthFeatureModel = AuthFeatureModel(token: 1);
  test(
    'Should be a subclass of Auth feauture entity',
    () async {
      expect(tAuthFeatureModel, isA<AuthToken>());
    },
  );
}
