import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_feature_event.dart';
part 'auth_feature_state.dart';

class AuthFeatureBloc extends Bloc<AuthFeatureEvent, AuthFeatureState> {
  AuthFeatureBloc() : super(AuthFeatureInitial()) {
    on<AuthFeatureEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
