import 'dart:convert';

import 'package:auth_feature/feature/data/models/auth_feature_model.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../domain/entities/auth_token.dart';

abstract class AuthFeatureLocalDataSource {
  Future<AuthFeatureModel> restoreToken();
  Future<AuthFeatureModel> clearStorage();

  Future<void> cacheToken(AuthFeatureModel tokenToCache);
}

class AuthFeatureLocalDataSourceImpl implements AuthFeatureLocalDataSource {
  final SharedPreferences sharedPreferences;
  late AuthFeatureLocalDataSource authFeatureLocalDataSource;

//   String? sfToken;

// getStringValuesSF() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   sfToken = prefs.getString('token').toString();
// }

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
    // TODO: implement clearStorage
    throw UnimplementedError();
  }
}
