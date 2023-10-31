import 'package:auth_feature/core/usecase.dart';
import 'package:auth_feature/feature/domain/entities/auth_token.dart';
import 'package:auth_feature/feature/domain/repositories/auth_feature_repository.dart';
import 'package:auth_feature/feature/domain/usecases/restore_token.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'get_token_test.dart';

class MockAuthFeatureRepository extends Mock implements AuthFeatureRepository {}

void main() {
  late RestoreToken usecase;
  late MockAuthFeatureRepository mockAuthFeatureRepository;

  setUp(() {
    mockAuthFeatureRepository = MockAuthFeatureRepository();
    usecase = RestoreToken(mockAuthFeatureRepository);
  });

  const tAuthToken = AuthToken(token: 1);

  test(
    'should get token from the repository',
    () async {
      // arrange
      when(mockAuthFeatureRepository.restoreToken())
          .thenAnswer((_) async => const Right(tAuthToken));
      // act
      final result = await usecase(NoParams());
      // assert
      expect(result, const Right(tAuthToken));
      verify(mockAuthFeatureRepository.restoreToken());
      verifyNoMoreInteractions(mockAuthFeatureRepository);
    },
  );
}
