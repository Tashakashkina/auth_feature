import 'package:auth_feature/core/error/failures.dart';
import 'package:auth_feature/core/usecase.dart';
import 'package:auth_feature/profile_feature/domain/entities/user.dart';
import 'package:auth_feature/profile_feature/domain/usecases/get_user_data.dart';
import 'package:auth_feature/profile_feature/presentation/bloc/profile_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetUserDataUsecase extends Mock implements GetUserDataUsecase {}

void main() {
  late ProfileBloc profileBloc;
  late MockGetUserDataUsecase mockGetUserDataUsecase;
  final tUser = User(
    uid: '1234',
    email: 'email',
    time: DateTime.now(),
  );

  setUp(() {
    mockGetUserDataUsecase = MockGetUserDataUsecase();
    profileBloc = ProfileBloc(getUserData: mockGetUserDataUsecase);
  });
  group('Bloc Test', () {
    test('initial state should be ProfileInitial()', () async {
      expect(profileBloc.state, equals(ProfileInitial()));
    });
    test('should get data from usecase', () async {
      when(
        () => mockGetUserDataUsecase.call(NoParams()),
      ).thenAnswer((_) async => Right(tUser));

      profileBloc.add(GetUserEvent());
      await untilCalled(() => mockGetUserDataUsecase.call(NoParams()));

      verify(() => mockGetUserDataUsecase.call(NoParams()));
    });
    test('should emit ProfileLoaded when data is obtained succesfully',
        () async {
      when(
        () => mockGetUserDataUsecase.call(NoParams()),
      ).thenAnswer((_) async => Right(tUser));

      final expected = [
        ProfileLoading(),
        ProfileLoaded(),
      ];
      expectLater(profileBloc.stream, emitsInOrder(expected));

      profileBloc.add(GetUserEvent());
    });
    test('should emit ProfileError if data fails', () async {
      when(
        () => mockGetUserDataUsecase.call(NoParams()),
      ).thenAnswer((_) async => Left(ServerFailure()));

      final expected = [
        ProfileLoading(),
        const ProfileError(error: 'error'),
      ];
      expectLater(profileBloc.stream, emitsInOrder(expected));

      profileBloc.add(GetUserEvent());
    });
  });
}
