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
  late GetUserDataUsecase usecase;
  late MockProfileFeatureRepository mockProfileFeatureRepository;

  final tUser = User(uid: '1234', email: 'email', time: DateTime.now());
  setUp(() {
    mockProfileFeatureRepository = MockProfileFeatureRepository();
    usecase = GetUserDataUsecase(repository: mockProfileFeatureRepository);
  });

  test(
    'should get user data',
    () async {
      // arrange
      when(() => mockProfileFeatureRepository.getUserData())
          .thenAnswer((_) async => Right(tUser));
      // act
      final result = await usecase(NoParams());
      // assert
      verify(() => mockProfileFeatureRepository.getUserData());
      expect(result, Right(tUser));

      verifyNoMoreInteractions(mockProfileFeatureRepository);
    },
  );
}
