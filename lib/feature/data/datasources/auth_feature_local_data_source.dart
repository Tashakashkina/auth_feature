import 'dart:convert';

import 'package:auth_feature/feature/data/models.dart/auth_feature_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/error/exceptions.dart';

abstract class AuthFeatureLocalDataSource {
  Future<AuthFeatureModel> getAuthToken();

  Future<void> cacheAuthFeatureToken(AuthFeatureModel tokenToCache);
}

class AuthFeatureLocalDataSourceImpl implements AuthFeatureLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthFeatureLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<AuthFeatureModel> getAuthToken() {
    final jsonString = sharedPreferences.getString('token');
    if (jsonString != null) {
      return Future.value(AuthFeatureModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheAuthFeatureToken(AuthFeatureModel tokenToCache) {
    return sharedPreferences.setString(
      'token',
      json.encode(tokenToCache.toJson()),
    );
  }
}
