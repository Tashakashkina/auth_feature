import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

String? sfToken;
//function for getting value from SharedPreferences
getStringValuesSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  sfToken = prefs.getString('token').toString();
}

class LoginBloc extends Bloc<AuthEvent, AuthState> {
  LoginBloc() : super(AuthInitial()) {
    String? sfToken;
//calling function to get value by SharedPreferences
    getStringValuesSF();
    on((event, emit) async {
      if (event is GetTokenEvent) {
        await Future.delayed(const Duration(seconds: 3), () async {
          //if the token is found then loaded state emitted
          if (event.token == sfToken) {
            emit(AuthCompleted());
          }
        }).onError((error, stackTrace) {
          emit(AuthError(error.toString()));
        });
      }
    });
  }
}
