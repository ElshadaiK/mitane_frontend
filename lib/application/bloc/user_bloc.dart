import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitane_frontend/application/events/auth_events.dart';
import 'package:mitane_frontend/application/states/auth_state.dart';
import 'package:mitane_frontend/domain/validation/auth/invalid_validation.dart';
import 'package:mitane_frontend/domain/validation/auth/password_validation.dart';
import 'package:mitane_frontend/domain/validation/auth/phone_validation.dart';
import 'package:mitane_frontend/infrastructure/repository/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(LoggedOut());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LogginEvent) {
      yield LoggingIn();

      try {
        final PhoneNumber phone = PhoneNumber(event.props.phone);
        final Password password = Password(event.props.password);

        final userData = await authRepository.signIn(phone, password);
      } on InvalidCredential catch (e) {
        final msg = e.failedValue;
        print('error: $msg');
        yield LoggingError();
      }
    }
    if (event is LoggedOut) {
      print('Logged out');
    }
  }
}
