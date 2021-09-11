import 'dart:async';

import 'package:dio/dio.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mitane_frontend/application/auth/states/auth_state.dart';
import 'package:mitane_frontend/infrastructure/auth/data_provider/auth_provider.dart';
import 'package:mitane_frontend/application/auth/events/auth_events.dart';
import 'package:mitane_frontend/application/auth/bloc/auth_bloc.dart';
import 'package:mitane_frontend/infrastructure/auth/repository/auth_repository.dart';
import 'package:test/test.dart';

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}
class MockAuthRepository extends MockBloc<AuthEvent, AuthState> implements AuthRepository {}

void main() {
  MockAuthRepository authRepository = MockAuthRepository();
  AuthBloc authenticationBloc = AuthBloc(authRepository: authRepository);

  setUp(() {
    authRepository = MockAuthRepository();
    authenticationBloc = AuthBloc(authRepository: authRepository);
  });
  
  tearDown(() {
    authenticationBloc.close();
  });

  
  group('Auth Bloc login test', () {
    blocTest<AuthBloc, AuthState>(
      'emits [] when nothing is added',
      build: () {
        final Dio dio = Dio();
        final AuthRepository authRepo =
            AuthRepository(authDataProvider: AuthDataProvider(dio: dio));
        return AuthBloc(authRepository: authRepo);
      },
      expect: () => <AuthState>[],
    );

    //   blocTest<AuthBloc, AuthState>(
    //     'Login Username changed',
    //     build: () {
    //       final AuthRepository authRepo = AuthRepository(AuthDataProvider(http.Client()));
    //       return  AuthBloc(authRepo: authRepo);
    //     },
    //     act:(bloc){
    //       return bloc.add(
    //           LoginUsernameChanged(username: "username"));
    //       },
    //     wait: const Duration(milliseconds: 500),
    //     expect: () {
    //       AuthState usernameState = AuthState(username:'username',password:'',formStatus: InitialFormStatus());
    //       return [isA<AuthState>()];
    //     },
    //   );

    //   blocTest<AuthBloc, AuthState>(
    //     'Login Password changed',
    //     build: () {
    //       final AuthRepository authRepo = AuthRepository(AuthDataProvider(http.Client()));
    //       return  AuthBloc(authRepo: authRepo);
    //     },
    //     act:(bloc){
    //       return bloc.add(
    //           LoginPasswordChanged(password: "password"));
    //     },
    //     wait: const Duration(milliseconds: 500),
    //     expect: () {
    //       return [isA<AuthState>()];
    //     },
    //   );

    //   blocTest<AuthBloc, AuthState>(
    //     'On submit login',
    //     build: () {
    //       final AuthRepository authRepo = AuthRepository(AuthDataProvider(http.Client()));
    //       return  AuthBloc(authRepo: authRepo);
    //     },
    //     act:(bloc){
    //       return bloc.add(
    //           LoginSubmitted());
    //     },
    //     wait: const Duration(milliseconds: 500),
    //     expect: () {
    //       return [isA<AuthState>(),isA<AuthState>()];
    //     },
    //   );
    // });
    // group('Authbloc register test', () {
    //   blocTest<SignUpBloc, SignUpState>(
    //     'emits [] when nothing is added',
    //     build: () {
    //       final AuthRepository authRepo = AuthRepository(AuthDataProvider(http.Client()));
    //       return  SignUpBloc(authRepo: authRepo);
    //     },
    //     expect: () => <SignUpState>[],
    //   );

    //   blocTest<SignUpBloc, SignUpState>(
    //     'Signup submitted',
    //     build: () {
    //       final AuthRepository authRepo = AuthRepository(AuthDataProvider(http.Client()));
    //       return  SignUpBloc(authRepo: authRepo);
    //     },
    //     act:(bloc){
    //       return bloc.add(
    //           SignUpSubmitted());
    //     },
    //     wait: const Duration(milliseconds: 500),
    //     expect: () {
    //       return [isA<SignUpState>()];
    //     },
    //   );
  });
}
