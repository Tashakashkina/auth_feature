import 'package:auth_feature/core/error/exceptions.dart';
import 'package:auth_feature/core/error/failures.dart';
import 'package:auth_feature/feature/network/network_info.dart';
import 'package:auth_feature/profile_feature/data/datasources/profile_feature_remote_datasource.dart';
import 'package:auth_feature/profile_feature/data/models/profile_feature_model.dart';
import 'package:auth_feature/profile_feature/data/repositories/profile_feature_repository_impl.dart';
import 'package:auth_feature/profile_feature/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRemoteDataSource extends Mock
    implements ProfileFeatureRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late ProfileFeatureRepositoryImpl profileFeatureRepositoryImpl;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;
  final tUserModel = UserModel(
    uid: '12345',
    email: 'email',
    time: DateTime.now(),
  );
  User tUser = tUserModel;
  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    profileFeatureRepositoryImpl = ProfileFeatureRepositoryImpl(
      networkInfo: mockNetworkInfo,
      remoteDataSource: mockRemoteDataSource,
    );
  });
  group('get user data', () {
    test('should check if device is online', () async {
      when(
        () => mockNetworkInfo.isConnected,
      ).thenAnswer((_) async => true);
      await mockNetworkInfo.isConnected;
      verify(() => mockNetworkInfo.isConnected);
    });
    group('when device is online', () {
      setUp(() {
        when(
          () => mockNetworkInfo.isConnected,
        ).thenAnswer((_) async => true);
      });
      test('should return remote data when call is succesfull', () async {
        when(
          () => mockRemoteDataSource.getUserData(),
        ).thenAnswer((_) async => tUserModel);
        final result = await profileFeatureRepositoryImpl.getUserData();
        verify(
          () => mockRemoteDataSource.getUserData(),
        );
        expect(result, equals(Right(tUser)));
      });
      test('should return failure when call is unsuccesfull', () async {
        when(
          () => mockRemoteDataSource.getUserData(),
        ).thenThrow(ServerException());
        final result = await profileFeatureRepositoryImpl.getUserData();
        verify(
          () => mockRemoteDataSource.getUserData(),
        );
        expect(result, equals(Left(ServerFailure())));
      });
    });
    group('device is offline', () {
      setUp(() {
        when(
          () => mockNetworkInfo.isConnected,
        ).thenAnswer((_) async => false);
      });
      test('should return failure', () async {
        final result = await profileFeatureRepositoryImpl.getUserData();
        verifyNever(
          () => mockRemoteDataSource.getUserData(),
        );
        expect(result, equals(Left(ServerFailure())));
      });
    });
  });
}
