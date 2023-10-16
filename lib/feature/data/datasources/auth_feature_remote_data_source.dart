import 'package:auth_feature/feature/data/models/auth_feature_model.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../domain/entities/auth_token.dart';

abstract class AuthFeatureRemoteDataSource {
  Future<AuthFeatureModel> getAuthToken();
}

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

  @override
  Future<AuthFeatureModel> getAuthToken() async {
    await instance.verifyPhoneNumber(
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
        phoneAuthCredential.accessToken;
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid');
        }
      },
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    throw ServerException();
  }
}
