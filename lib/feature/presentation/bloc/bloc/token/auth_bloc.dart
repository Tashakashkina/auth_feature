import 'package:auth_feature/core/usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../domain/usecases/restore_token.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthTokenEvent, AuthState> {
  final RestoreToken restoreToken;

  AuthBloc({required this.restoreToken}) : super(AuthChecking()) {
    on<CheckAuthToken>(_checkIfAuth);
  }

  Future<void> _checkIfAuth(
      CheckAuthToken event, Emitter<AuthState> emit) async {
    emit(AuthChecking());
    final result = await restoreToken.call(NoParams());

    result.fold((l) => emit(AuthNotCompleted()), (r) => emit(AuthCompleted()));
  }
}
