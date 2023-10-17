import 'dart:convert';
import 'package:auth_feature/feature/data/models/auth_feature_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/error/exceptions.dart';

abstract class AuthFeatureLocalDataSource {
  Future<AuthFeatureModel> restoreToken();
  Future<AuthFeatureModel> clearStorage();
  Future<AuthFeatureModel> getAuthToken();

  Future<void> cacheToken(AuthFeatureModel tokenToCache);
}

class AuthFeatureLocalDataSourceImpl implements AuthFeatureLocalDataSource {
  final SharedPreferences sharedPreferences;
  late AuthFeatureLocalDataSource authFeatureLocalDataSource;

  AuthFeatureLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<AuthFeatureModel> restoreToken() {
    final jsonString = sharedPreferences.getString('token');
    if (jsonString != null) {
      return Future.value(AuthFeatureModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheToken(AuthFeatureModel tokenToCache) {
    return sharedPreferences.setString(
      'token',
      json.encode(tokenToCache.toJson()),
    );
  }

  @override
  Future<AuthFeatureModel> clearStorage() {
    throw UnimplementedError();
  }

  @override
  Future<AuthFeatureModel> getAuthToken() {
    throw UnimplementedError();
  }
}
