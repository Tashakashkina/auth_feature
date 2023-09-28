import 'package:auth_feature/core/usecase.dart';
import 'package:auth_feature/feature/domain/entities/auth_token.dart';
import 'package:auth_feature/feature/domain/repositories/auth_feature_repository.dart';
import 'package:auth_feature/feature/domain/usecases/get_auth_feature_token.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAuthFeatureRepository extends Mock implements AuthFeatureRepository {}

void main() {
  late GetAuthFeatureToken usecase;
  late MockAuthFeatureRepository mockAuthFeatureRepository;

  setUp(() {
    mockAuthFeatureRepository = MockAuthFeatureRepository();
    usecase = GetAuthFeatureToken(mockAuthFeatureRepository);
  });
  const tAuthToken = AuthToken(token: 1);
  test(
    'should get token from the local repository',
    () async {
      when(mockAuthFeatureRepository.getAuthToken())
          .thenAnswer((_) async => const Right(tAuthToken));

      final result = await usecase(NoParams());

      expect(result, const Right(tAuthToken));
      verify(mockAuthFeatureRepository.getAuthToken());
      verifyNoMoreInteractions(mockAuthFeatureRepository);
    },
  );
}
