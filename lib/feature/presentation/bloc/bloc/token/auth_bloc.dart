import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

String? sfToken;

getStringValuesSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  sfToken = prefs.getString('token').toString();
}

class AuthBloc extends Bloc<AuthTokenEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    getStringValuesSF();
    on((event, emit) async {
      if (event is GetTokenFromStorage) {
        await Future.delayed(const Duration(seconds: 3), () async {
          if (event.tokenString == sfToken) {
            emit(AuthCompleted());
          }
        }).onError((error, stackTrace) {
          emit(AuthError(error.toString()));
        });
      }
    });
  }
}
