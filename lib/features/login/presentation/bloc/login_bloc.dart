import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
<<<<<<< HEAD

  LoginBloc() : super(LoginInitial());
=======
  LoginBloc(LoginState initialState) : super(initialState);
>>>>>>> master

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    // TODO: implement mapEventToState
  }
}
