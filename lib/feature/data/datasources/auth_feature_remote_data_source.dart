import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthFeatureRemoteDataSource {}

class AuthFeatureRemoteDataSourceImpl implements AuthFeatureRemoteDataSource {
  final FirebaseAuth instance;

  AuthFeatureRemoteDataSourceImpl({required this.instance});
  Future<void> saveToken(data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("token", data['token']);
  }

  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }

  Future<void> clearStorage() async {
    return await FirebaseAuth.instance.signOut();
  }

  Future<UserCredential?> getAuthToken(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: 'qwe@qwe.qwe', password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }
}
