import 'package:auth_feature/feature/domain/repositories/auth_feature_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecase.dart';
import '../entities/auth_token.dart';

class GetAuthFeatureToken implements UseCase<AuthToken, NoParams> {
  final AuthFeatureRepository repository;

  GetAuthFeatureToken(this.repository);

  @override
  Future<Either<Failure, AuthToken>> call(NoParams params) {
    return repository.getAuthToken();
  }
}
