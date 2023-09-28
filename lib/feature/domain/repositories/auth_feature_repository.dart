import 'package:auth_feature/feature/domain/entities/auth_token.dart';

import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';

abstract class AuthFeatureRepository {
  Future<Either<Failure, AuthToken>> getAuthToken();
}
