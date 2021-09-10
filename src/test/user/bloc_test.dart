import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mitane_frontend/application/user/bloc/user_bloc.dart';
import 'package:mitane_frontend/application/user/bloc/user_blocs.dart';
import 'package:mitane_frontend/application/user/events/user_events.dart';
import 'package:mitane_frontend/domain/user/entity/user_model.dart';
import 'package:mitane_frontend/infrastructure/user/data_provider/user_provider.dart';
import 'package:mitane_frontend/infrastructure/user/repository/user_repository.dart';
import 'package:mocktail/mocktail.dart';


class MockUserRepository extends Mock implements UserRepository {}

class MockClient extends Mock implements UserDataProvider {}

void main() {
  MockUserRepository mockUserRepository = MockUserRepository();


  final user = User(id: "aa",password: "aa",roles: "aa",phoneNo: 5612,name: "aa");
  
  Future<List<User>> createFutureUsers() async {
    return [User(id: "aa",password: "aa",roles: "aa",phoneNo: 5612,name: "aa")];
  }
  Future<User> createFutureUser() async {
    return User(id: "aa",password: "aa",roles: "aa",phoneNo: 5612,name: "aa");
  }
  Future<void> createFutureVoid() async {
    return;
  }

  setUp(() {
    mockUserRepository = MockUserRepository();
    
  });

  blocTest<UserBloc , UserState>(
    'UserAdminLoad emits [UserAdminLoading,UserAdminOperationSuccess] when Success',
    
    build: () {
      when(() => mockUserRepository.fetchAll())
        .thenAnswer((realInvocation) => createFutureUsers());
      return UserBloc(userRepository: mockUserRepository);
    },
    act: (bloc) => bloc.add(UserAdminLoad()),
    expect: (){
      return [ UserAdminLoading(),isA<UserAdminOperationSuccess>()];
    },
  );

  blocTest<UserBloc , UserState>(
    'UserAdminLoad emits [UserAdminLoading,UserAdminOperationFailure] when failure',
    
    build: () {
      return UserBloc(userRepository: mockUserRepository);
    },
    act: (bloc) => bloc.add(UserAdminLoad()),
    expect: (){
      return [ UserAdminLoading(),UserAdminOperationFailure()];
    },
  );

  blocTest<UserBloc , UserState>(
    'UserAdminCreate emits [UserAdminOperationSuccess] when Success',
    
    build: () {
      when(() => mockUserRepository.create(user))
        .thenAnswer((realInvocation) => createFutureUser());
      when(() => mockUserRepository.fetchAll())
        .thenAnswer((realInvocation) => createFutureUsers());
      return UserBloc(userRepository: mockUserRepository);
    },
    act: (bloc) => bloc.add(UserAdminCreate(user)),
    expect: (){
      return [isA<UserAdminOperationSuccess>()];
    },
  );

  blocTest<UserBloc , UserState>(
    'UserAdminUpdate emits [UserAdminOperationSuccess] when Success',
    
    build: () {
      when(() => mockUserRepository.update("aa", user))
        .thenAnswer((realInvocation) => createFutureUser());
      when(() => mockUserRepository.fetchAll())
        .thenAnswer((realInvocation) => createFutureUsers());
      return UserBloc(userRepository: mockUserRepository);
    },
    act: (bloc) => bloc.add(UserAdminUpdate(user)),
    expect: (){
      return [isA<UserAdminOperationSuccess>()];
    },
  );

  blocTest<UserBloc , UserState>(
    'UserAdminDelete emits [UserAdminOperationSuccess] when failure',
    
    build: () {
      when(() => mockUserRepository.delete("aa"))
        .thenAnswer((realInvocation) => createFutureVoid());
      when(() => mockUserRepository.fetchAll())
        .thenAnswer((realInvocation) => createFutureUsers());
      return UserBloc(userRepository: mockUserRepository);
    },
    act: (bloc) => bloc.add(UserAdminUpdate(user)),
    expect: (){
      return [isA<UserAdminOperationFailure>()];
    },
  );
}
