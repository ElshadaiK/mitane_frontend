import 'package:mitane_frontend/domain/entity/user_model.dart';

abstract class AuthEvent{
  final props;
  AuthEvent({required this.props});
}

class LoginEvent extends AuthEvent{
  final Login login;

  Login get props => login;

  LoginEvent({required this.login}):super(props: login);
}

class LogoutEvent extends AuthEvent{
  final logout;

  LogoutEvent({required this.logout}):super(props: logout);
}

class RegisterEvent extends AuthEvent{
  final Register register;
  Register get props=> register;

  RegisterEvent({required this.register }):super(props: "");
}

