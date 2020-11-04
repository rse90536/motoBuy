part of 'login2_bloc.dart';

abstract class Login2State extends Equatable {
  const Login2State();
}

class Login2Initial extends Login2State {
  @override
  List<Object> get props => [];
}
class Login2Loading extends Login2State {
  const Login2Loading();

  @override
  List<Object> get props => [];
}