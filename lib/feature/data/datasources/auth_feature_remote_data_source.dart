import 'package:auth_feature/feature/data/models.dart/auth_feature_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../core/error/exceptions.dart';

abstract class AuthFeatureRemoteDataSource {
  Future<AuthFeatureModel> getAuthToken();
}

class AuthFeatureRemoteDataSourceImpl implements AuthFeatureRemoteDataSource {
  late http.Client client;

  AuthFeatureRemoteDataSourceImpl({required this.client});
  @override
  Future<AuthFeatureModel> getAuthToken() => _getTokenFromUrl('http://');

  Future<AuthFeatureModel> _getTokenFromUrl(String url) async {
    final response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return AuthFeatureModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
