import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitane_frontend/application/auth/events/auth_events.dart';
import 'package:mitane_frontend/application/auth/states/auth_state.dart';
import 'package:mitane_frontend/domain/entity/user_model.dart';
import 'package:mitane_frontend/domain/validation/auth/invalid_validation.dart';
import 'package:mitane_frontend/infrastructure/auth/repository/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(InitState());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginEvent) {
      yield LoggingIn();

      try {
        User user = await authRepository.signIn(event.login);
        print(user.name);
        yield LoginSuccess();
      } on InvalidCredential catch (e) {
        final msg = e.failedValue;
        print(msg);
        yield LogginError('$msg');
      }
    } else if (event is RegisterEvent) {
      yield Registering();
      try {
        bool res = await authRepository.signUp(event.register);
        if (res) {
          print("created successfuly");
          yield RegisterSuccess();
        }

      } catch (e) {}
    }
  }
}
