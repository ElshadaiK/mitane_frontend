import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitane_frontend/application/admin/userAdmin/events/UserAdmin_Event.dart';
import 'package:mitane_frontend/application/admin/userAdmin/states/UserAdmin_State.dart';
import 'package:mitane_frontend/infrastructure/admin/userAdmin/repository/UserAdmin_Repository.dart';

class UserAdminBloc extends Bloc<UserAdminEvent, UserAdminState> {
  final UserAdminRepository userAdminRepository;

  UserAdminBloc({required this.userAdminRepository}) : super(UserAdminLoading());

  @override
  Stream<UserAdminState> mapEventToState(UserAdminEvent event) async* {
    if (event is UserAdminLoad) {
      yield UserAdminLoading();
      try {
        final userAdmins = await userAdminRepository.fetchAll();
        print("Successfully listed");
        yield UserAdminOperationSuccess(userAdmins);
      } catch (_) {
        yield UserAdminOperationFailure();
      }
    }

    if (event is UserAdminCreate) {
      try {
        await userAdminRepository.create(event.user);
        print(event.user);
        final userAdmins = await userAdminRepository.fetchAll();
        print("Successfully created and listed");
        yield UserAdminOperationSuccess(userAdmins);
      } catch (_) {
        yield UserAdminOperationFailure();
      }
    }

    if (event is UserAdminUpdate) {
      try {
        await userAdminRepository.update(event.user.id ?? "", event.user);
        final userAdmins = await userAdminRepository.fetchAll();
        print("Successfully updated and listed");
        yield UserAdminOperationSuccess(userAdmins);
      } catch (_) {
        yield UserAdminOperationFailure();
      }
    }

    if (event is UserAdminDelete) {
      try {
        await userAdminRepository.delete(event.id);
        final userAdmins = await userAdminRepository.fetchAll();
        print("Successfully deleted and listed");
        yield UserAdminOperationSuccess(userAdmins);
      } catch (_) {
        yield UserAdminOperationFailure();
      }
    }
  }
}