import 'dart:convert';

import 'package:auth_feature/profile_feature/data/models/profile_feature_model.dart';
import 'package:auth_feature/profile_feature/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  const tUserModel = UserModel(
    uid: '1234',
    email: 'email',
    time: 1,
  );
  test(
    'Should be a subclass of User entity',
    () async {
      expect(tUserModel, isA<User>());
    },
  );
}
