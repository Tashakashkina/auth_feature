import 'package:auth_feature/profile_feature/data/models/profile_feature_model.dart';

abstract class ProfileFeatureRemoteDataSource {
  Future<UserModel> getUserData();
}
