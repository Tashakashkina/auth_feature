import 'package:auth_feature/profile_feature/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';

abstract class ProfileFeatureRepository {
  Future<Either<Failure, User>> getUserData();
}
