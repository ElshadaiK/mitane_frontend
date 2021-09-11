import 'package:mitane_frontend/domain/auth/entity/auth_model.dart';

abstract class AuthState{}


// login user state
class InitState extends AuthState{}
class LoggingIn extends AuthState{}
class LoginSuccess  extends AuthState{
  final User user;
  LoginSuccess({required this.user});
}
class LogginError extends AuthState{
  final String errorMsg;

  LogginError(this.errorMsg);
}

// logut user state
class Logout extends AuthState{}

// register user state
class Registering extends AuthState{}
class RegisterSuccess extends  AuthState{}
class RegisterError extends AuthState{}

// forgot password
