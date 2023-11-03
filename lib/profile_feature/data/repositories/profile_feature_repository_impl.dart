import 'package:auth_feature/core/error/failures.dart';
import 'package:auth_feature/feature/network/network_info.dart';
import 'package:auth_feature/profile_feature/data/datasources/profile_feature_remote_datasource.dart';
import 'package:auth_feature/profile_feature/domain/entities/user.dart';
import 'package:auth_feature/profile_feature/domain/repositories/profile_feature_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../core/error/exceptions.dart';

class ProfileFeatureRepositoryImpl implements ProfileFeatureRepository {
  final ProfileFeatureRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ProfileFeatureRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, User>> getUserData() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.getUserData();
        return Right(result!);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
