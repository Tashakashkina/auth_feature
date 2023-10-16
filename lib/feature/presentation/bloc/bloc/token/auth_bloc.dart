import 'dart:async';

import 'package:auth_feature/core/usecase.dart';
import 'package:auth_feature/feature/domain/repositories/auth_feature_repository.dart';
import 'package:auth_feature/feature/domain/usecases/clear_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../domain/usecases/restore_token.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthTokenEvent, AuthState> {
  final RestoreToken restoreToken;
  final ClearStorage clearStorage;

  AuthBloc({required this.clearStorage, required this.restoreToken})
      : super(AuthChecking()) {
    on<CheckAuthToken>(_checkIfAuth);
    on<ClearTokenStorage>(_clearToken);
    // on<GetTokenFromFirebase>(_getToken);
  }

  Future<void> _checkIfAuth(
      CheckAuthToken event, Emitter<AuthState> emit) async {
    emit(AuthChecking());
    final result = await restoreToken.call(NoParams());

    result.fold((l) => emit(AuthNotCompleted()), (r) => emit(AuthCompleted()));
  }

  Future<void> _clearToken<ClearTokenStorage>(
      ClearTokenStorage event, Emitter<AuthState> emit) async {
    emit(AuthClearStorage());
    final result = await clearStorage.call(NoParams());
    result.fold(
        (l) => emit(const AuthError('error')), (r) => emit(AuthClearStorage()));
  }
}
