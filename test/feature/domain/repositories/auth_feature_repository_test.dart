import 'package:auth_feature/core/error/failures.dart';
import 'package:auth_feature/core/usecase.dart';
import 'package:auth_feature/feature/domain/entities/auth_token.dart';
import 'package:auth_feature/feature/domain/repositories/auth_feature_repository.dart';
import 'package:auth_feature/feature/domain/usecases/clear_storage.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAuthFeatureRepository extends Mock implements AuthFeatureRepository {}

void main() {
  late AuthFeatureRepository mockAuthFeatureRepository;
  late ClearStorage usecase;
  setUp(() {
    mockAuthFeatureRepository = MockAuthFeatureRepository();
    usecase = ClearStorage(mockAuthFeatureRepository);
  });
  const tAuthToken = AuthToken(token: 1);
  test("should call the clearStorage repo method", () async {
    //arrange

    Either<Failure, AuthToken> repoResponse = const Right(tAuthToken);
    when(() => mockAuthFeatureRepository.clearStorage())
        .thenAnswer((_) async => repoResponse);

    //act
    final result = await usecase(NoParams());

    //assert
    expect(result, equals(repoResponse));
    verify(() => mockAuthFeatureRepository.clearStorage());
    verifyNoMoreInteractions(mockAuthFeatureRepository);
  });
}
