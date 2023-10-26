import 'package:auth_feature/feature/data/models/auth_feature_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';

abstract class AuthFeatureRemoteDataSource {
  Future<AuthFeatureModel?> getAuthToken(String email, String password);
}

class AuthFeatureRemoteDataSourceImpl implements AuthFeatureRemoteDataSource {
  final FirebaseAuth instance;

  AuthFeatureRemoteDataSourceImpl({required this.instance});

  @override
  Future<AuthFeatureModel?> getAuthToken(String email, String password) async {
    try {
      UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print('sign In');
      return AuthFeatureModel(token: result.credential!.token!);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }
}
