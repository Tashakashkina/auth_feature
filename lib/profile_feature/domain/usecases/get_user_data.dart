import 'package:auth_feature/core/error/failures.dart';
import 'package:auth_feature/profile_feature/domain/entities/user.dart';
import 'package:auth_feature/profile_feature/domain/repositories/profile_feature_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/usecase.dart';

class GetUserDataUsecase implements UseCase<User, NoParams> {
  final ProfileFeatureRepository repository;

  GetUserDataUsecase({required this.repository});

  @override
  Future<Either<Failure, User>> call(NoParams params) {
    return repository.getUserData();
  }
}
