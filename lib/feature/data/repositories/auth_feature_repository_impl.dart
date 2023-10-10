import 'package:auth_feature/core/error/failures.dart';
import 'package:auth_feature/feature/domain/repositories/auth_feature_repository.dart';
import 'package:dartz/dartz.dart';
import '../../network/network_info.dart';
import '../../domain/entities/auth_token.dart';
import '../datasources/auth_feature_local_data_source.dart';
import '../datasources/auth_feature_remote_data_source.dart';

class AuthFeatureRepositoryImpl implements AuthFeatureRepository {
  final AuthFeatureLocalDataSource localDataSource;
  final AuthFeatureRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AuthFeatureRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, AuthToken>> getAuthToken() async {
    await networkInfo.isConnected;
    return Right(await remoteDataSource.getAuthToken());
  }

  @override
  Future<Either<Failure, AuthToken>> restoreToken() async {
    return Right(await localDataSource.restoreToken());
  }

  @override
  Future<Either<Failure, AuthToken>> clearStorage() {
    // TODO: implement clearStorage
    throw UnimplementedError();
  }
}
