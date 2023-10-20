import 'dart:async';
import 'package:auth_feature/core/usecase.dart';
import 'package:auth_feature/feature/domain/usecases/clear_storage.dart';
import 'package:auth_feature/feature/domain/usecases/get_token.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import '../../../../domain/usecases/restore_token.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthTokenEvent, AuthState> {
  final RestoreToken restoreToken;
  final ClearStorage clearStorage;
  final GetToken getAuthToken;

  AuthBloc(
      {required this.getAuthToken,
      required this.clearStorage,
      required this.restoreToken})
      : super(AuthChecking()) {
    on<CheckAuthToken>(_checkIfAuth);
    on<ClearTokenStorage>(_clearToken);
    on<GetTokenFromFirebase>(_getToken);
  }

  Future<void> _checkIfAuth(
      CheckAuthToken event, Emitter<AuthState> emit) async {
    emit(AuthChecking());
    final result = await restoreToken.call(NoParams());

    result.fold((l) => emit(AuthNotCompleted()), (r) => emit(AuthCompleted()));
  }

  Future<void> _clearToken(
      ClearTokenStorage event, Emitter<AuthState> emit) async {
    emit(AuthClearStorage());
    final result = await clearStorage.call(NoParams());
    result.fold(
        (l) => emit(const AuthError('error')), (r) => emit(AuthNotCompleted()));
  }

  Future<void> _getToken(
      GetTokenFromFirebase event, Emitter<AuthState> emit) async {
    emit(AuthGetToken());
    final result = await getAuthToken
        .call(const EmailPasswordParams(email: '', password: ''));
    result.fold(
        (l) => emit(const AuthError('error')), (r) => emit(AuthCompleted()));
  }
}
