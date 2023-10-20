import 'package:auth_feature/feature/domain/entities/auth_token.dart';

import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';

abstract class AuthFeatureRepository {
  Future<Either<Failure, AuthToken>> getAuthToken(
      String email, String password);
  Future<Either<Failure, AuthToken>> restoreToken();
  Future<Either<Failure, AuthToken>> clearStorage();
}
