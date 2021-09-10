import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:mitane_frontend/application/user/bloc/user_bloc.dart';
import 'package:mitane_frontend/application/user/bloc/user_blocs.dart';
import 'package:mitane_frontend/application/user/events/user_events.dart';
import 'package:mitane_frontend/infrastructure/user/data_provider/user_provider.dart';
import 'package:mitane_frontend/infrastructure/user/repository/user_repository.dart';
import 'package:mockito/mockito.dart';

class MockUserRepository extends Mock implements UserRepository {}

class MockClient extends Mock implements UserDataProvider {}

void main() {
  MockUserRepository mockUserRepository = MockUserRepository();

  setUp(() {
    mockUserRepository = MockUserRepository();
  });

  blocTest<UserBloc , UserState>(
    'emits [UserAdminLoading,UserAdminOperationSuccess] when successful',
    build: () {
      when(mockUserRepository.fetchAll())
        .thenAnswer((_) async => weather)
      return UserBloc(userRepository: mockUserRepository);
    },
    act: (bloc) => bloc.add(UserAdminLoad()),
    expect: (){
      return [ UserAdminLoading(),UserAdminOperationSuccess()];
    },
  );
}
