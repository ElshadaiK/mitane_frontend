import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mitane_frontend/application/auth/bloc/auth_bloc.dart';
import 'package:mitane_frontend/application/auth/events/auth_events.dart';
import 'package:mitane_frontend/application/auth/states/auth_state.dart';
import 'package:mitane_frontend/domain/auth/entity/auth_model.dart';
import 'package:mitane_frontend/domain/auth/validation/invalid_validation.dart';
import 'package:mitane_frontend/infrastructure/auth/repository/auth_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  MockAuthRepository mockAuthRepository = MockAuthRepository();
  final login = Login(phone: '545', password: "asa");
  final registerU = Register(
      role: 'asd', phone: 'asd', name: 'asd', password: 'asd', confirm: 'asd');
  Future<User> createFutureUser() async {
    return User(
        password: "aa",
        name: "aa",
        token: "aa",
        phone: "545",
        roles: ["admin"]);
  }

  Future<bool> createFutureBool() async {
    return true;
  }

  group('auth tests', () {
    blocTest<AuthBloc, AuthState>(
      'LoginEvent emits [UserAdminLoading,UserAdminOperationSuccess] when Success',
      build: () {
        when(() => mockAuthRepository.signIn(login))
            .thenAnswer((realInvocation) => createFutureUser());
        return AuthBloc(authRepository: mockAuthRepository);
      },
      act: (bloc) => bloc.add(LoginEvent(login: login)),
      expect: () {
        return [isA<LoggingIn>(), isA<LoginSuccess>()];
      },
    );

    blocTest<AuthBloc, AuthState>(
      'LoginEvent emits [UserAdminLoading,UserAdminOperationSuccess] when failure',
      build: () {
        when(() => mockAuthRepository.signIn(login))
            .thenThrow(InvalidCredential);
        return AuthBloc(authRepository: mockAuthRepository);
      },
      act: (bloc) => bloc.add(LoginEvent(login: login)),
      expect: () {
        return [isA<LoggingIn>()];
      },
    );

    blocTest<AuthBloc, AuthState>(
      'RegisterEvent emits [UserAdminLoading,UserAdminOperationSuccess] when Success',
      build: () {
        when(() => mockAuthRepository.signUp(registerU))
            .thenAnswer((realInvocation) => createFutureBool());
        return AuthBloc(authRepository: mockAuthRepository);
      },
      act: (bloc) => bloc.add(RegisterEvent(register: registerU)),
      expect: () {
        return [isA<Registering>(), isA<RegisterSuccess>()];
      },
    );
  });
}
