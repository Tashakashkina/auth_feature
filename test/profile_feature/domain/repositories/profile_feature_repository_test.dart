import 'package:auth_feature/core/error/failures.dart';
import 'package:auth_feature/core/usecase.dart';
import 'package:auth_feature/profile_feature/domain/entities/user.dart';
import 'package:auth_feature/profile_feature/domain/repositories/profile_feature_repository.dart';
import 'package:auth_feature/profile_feature/domain/usecases/get_user_data.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockProfileFeatureRepository extends Mock
    implements ProfileFeatureRepository {}

void main() {
  late ProfileFeatureRepository mockProfileFeatureRepository;
  late GetUserDataUsecase usecase;
  setUp(() {
    mockProfileFeatureRepository = MockProfileFeatureRepository();
    usecase = GetUserDataUsecase(repository: mockProfileFeatureRepository);
  });
  final tUser = User(uid: '1234', email: 'email', time: DateTime.now());
  test("should call the getUserData repo method", () async {
    //arrange

    Either<Failure, User> repoResponse = Right(tUser);
    when(() => mockProfileFeatureRepository.getUserData())
        .thenAnswer((_) async => repoResponse);

    //act
    final result = await usecase(NoParams());

    //assert
    expect(result, equals(repoResponse));
    verify(() => mockProfileFeatureRepository.getUserData());
    verifyNoMoreInteractions(mockProfileFeatureRepository);
  });
}
