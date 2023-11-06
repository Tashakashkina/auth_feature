import 'package:auth_feature/core/usecase.dart';
import 'package:auth_feature/profile_feature/domain/entities/user.dart';
import 'package:auth_feature/profile_feature/domain/usecases/get_user_data.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserDataUsecase getUserData;

  ProfileBloc({
    required this.getUserData,
  }) : super(ProfileInitial()) {
    on<GetUserEvent>(_getUserData);
  }

  Future<void> _getUserData(
      GetUserEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    final result = await getUserData.call(NoParams());
    result.fold((l) => emit(const ProfileError(error: 'error')),
        (r) => emit(ProfileLoaded()));
  }
}
