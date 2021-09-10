import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitane_frontend/application/user/events/user_events.dart';
import 'package:mitane_frontend/application/user/states/user_state.dart';
import 'package:mitane_frontend/infrastructure/user/repository/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserAdminLoading());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserAdminLoad) {
      yield UserAdminLoading();
      try {
        final userAdmins = await userRepository.fetchAll();
        print("Successfully listed");
        yield UserAdminOperationSuccess(userAdmins);
      } catch (_) {
        yield UserAdminOperationFailure();
      }
    }

    if (event is UserAdminCreate) {
      try {
        await userRepository.create(event.user);
        print(event.user);
        final userAdmins = await userRepository.fetchAll();
        print("Successfully created and listed");
        yield UserAdminOperationSuccess(userAdmins);
      } catch (_) {
        yield UserAdminOperationFailure();
      }
    }

    if (event is UserAdminUpdate) {
      try {
        await userRepository.update(event.user.id ?? "", event.user);
        final userAdmins = await userRepository.fetchAll();
        print("Successfully updated and listed");
        yield UserAdminOperationSuccess(userAdmins);
      } catch (_) {
        yield UserAdminOperationFailure();
      }
    }

    if (event is UserAdminDelete) {
      try {
        await userRepository.delete(event.id);
        final userAdmins = await userRepository.fetchAll();
        print("Successfully deleted and listed");
        yield UserAdminOperationSuccess(userAdmins);
      } catch (_) {
        yield UserAdminOperationFailure();
      }
    }
  }
}
