import 'package:auth_feature/feature/domain/repositories/auth_feature_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecase.dart';
import '../entities/auth_feature.dart';

class GetAuthFeatureToken implements UseCase<AuthFeature, NoParams> {
  final AuthFeatureRepository repository;

  GetAuthFeatureToken(this.repository);

  @override
  Future<Either<Failure, AuthFeature>?> call(NoParams params) async {
    return await repository.getAuthFeatureToken();
  }
}
