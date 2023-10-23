import 'package:auth_feature/feature/data/models/auth_feature_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthFeatureRemoteDataSource {
  Future<AuthFeatureModel?> getAuthToken(String email, String password);
}

class AuthFeatureRemoteDataSourceImpl implements AuthFeatureRemoteDataSource {
  final FirebaseAuth instance;

  AuthFeatureRemoteDataSourceImpl({required this.instance});
  Future<void> saveToken(data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("token", data['token']);
  }

  @override
  Future<AuthFeatureModel?> getAuthToken(String email, String password) async {
    try {
      UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return AuthFeatureModel(token: result.credential!.token!);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }
}
