import 'package:auth_feature/core/error/failures.dart';
import 'package:auth_feature/feature/domain/repositories/auth_feature_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/usecase.dart';
import '../entities/auth_token.dart';

class ClearStorage implements UseCase<AuthToken, NoParams> {
  final AuthFeatureRepository repository;

  ClearStorage(this.repository);

  @override
  Future<Either<Failure, AuthToken>> call(NoParams params) {
    return repository.clearStorage();
  }
}
