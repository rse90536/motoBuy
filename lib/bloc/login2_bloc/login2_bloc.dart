import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login2_event.dart';
part 'login2_state.dart';

class Login2Bloc extends Bloc<Login2Event, Login2State> {
  Login2Bloc() : super(Login2Initial());

  @override
  Stream<Login2State> mapEventToState(
    Login2Event event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
