import 'package:auth_feature/feature/domain/repositories/auth_feature_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecase.dart';
import '../entities/auth_token.dart';

class GetToken implements UseCase<AuthToken, EmailPasswordParams> {
  final AuthFeatureRepository repository;

  GetToken(this.repository);

  @override
  Future<Either<Failure, AuthToken>> call(EmailPasswordParams params) {
    return repository.getAuthToken(params.email, params.password);
  }
}
