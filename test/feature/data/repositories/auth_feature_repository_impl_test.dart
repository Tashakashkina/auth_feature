import 'package:auth_feature/feature/network/network_info.dart';
import 'package:auth_feature/feature/data/datasources/auth_feature_local_data_source.dart';
import 'package:auth_feature/feature/data/datasources/auth_feature_remote_data_source.dart';
import 'package:auth_feature/feature/data/models/auth_feature_model.dart';
import 'package:auth_feature/feature/data/repositories/auth_feature_repository_impl.dart';
import 'package:auth_feature/feature/domain/entities/auth_token.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAuthFeatureRemoteDataSource extends Mock
    implements AuthFeatureRemoteDataSource {}

class MockAuthFeatureLocalDataSource extends Mock
    implements AuthFeatureLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late final AuthFeatureRepositoryImpl repository;
  late final MockAuthFeatureRemoteDataSource mockRemoteDataSource;
  late final MockAuthFeatureLocalDataSource mockLocalDataSource;
  late final MockNetworkInfo mockNetworkInfo;

  const tAuthFeatureModel = AuthFeatureModel(token: 1);
  const AuthToken tAuthToken = tAuthFeatureModel;

  setUp(() {
    mockRemoteDataSource = MockAuthFeatureRemoteDataSource();
    mockLocalDataSource = MockAuthFeatureLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = AuthFeatureRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('getAuthToken', () {
    test('checking network connection', () async {
      //arrange
      when(mockRemoteDataSource.getAuthToken())
          .thenAnswer((_) async => tAuthFeatureModel);
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      //act
      repository.getAuthToken();
      //assert
      verify(mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        //arrange
        when(mockRemoteDataSource.getAuthToken())
            .thenAnswer((_) async => tAuthFeatureModel);
        //act
        final result = await repository.getAuthToken();
        //asert
        verify(mockRemoteDataSource.getAuthToken());
        expect(result, const Right(tAuthToken));
      });

      group('device is offline', () {
        setUp(() {
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        });
      });
    });
  });
}
