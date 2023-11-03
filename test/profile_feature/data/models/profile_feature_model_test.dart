import 'package:auth_feature/profile_feature/data/models/profile_feature_model.dart';
import 'package:auth_feature/profile_feature/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tUserModel =
      UserModel(uid: '1234', email: 'email', time: DateTime.now());
  setUp(() {});
  test('UserModel should be subclass of User entity', () async {
    expect(tUserModel, isA<User>());
  });
}
