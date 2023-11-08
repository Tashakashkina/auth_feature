part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final User data;
  const ProfileLoaded({required this.data});
  @override
  List<Object> get props => [data];
}

final class ProfileError extends ProfileState {
  final String error;
  const ProfileError({
    required this.error,
  });
  @override
  List<Object> get props => [error];
}
