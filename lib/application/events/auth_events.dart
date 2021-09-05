import 'package:mitane_frontend/domain/entity/user_model.dart';

abstract class AuthEvent{
  final props;
  AuthEvent({required this.props});
}

class LogginEvent extends AuthEvent{
  final Login login;

  Login get props => login;

  LogginEvent({required this.login}):super(props: login);
}

class LogoutEvent extends AuthEvent{
  final logout;

  LogoutEvent({required this.logout}):super(props: logout);
}

class RegisterEvent extends AuthEvent{
  final String name;
  final String phone;
  final String password;

  RegisterEvent({required this.name,required this.phone ,required this.password}):super(props: "");
}

