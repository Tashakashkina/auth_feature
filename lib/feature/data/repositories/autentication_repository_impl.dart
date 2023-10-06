import 'package:firebase_auth/firebase_auth.dart';
import '../datasources/authentication_service.dart';
import '../models.dart/user_model.dart';

abstract class AuthenticationRepositoryImpl
    implements AuthenticationRepository {
  AuthenticationService service = AuthenticationService();
}

class AuthenticationRepository {
  getCurrentUser() {}
  signIn() {}
  signUp() {}
  signOut() {}
}
