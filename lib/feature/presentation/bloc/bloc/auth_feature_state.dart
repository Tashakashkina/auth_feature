part of 'auth_feature_bloc.dart';

sealed class AuthFeatureState extends Equatable {
  const AuthFeatureState();
  
  @override
  List<Object> get props => [];
}

final class AuthFeatureInitial extends AuthFeatureState {}
