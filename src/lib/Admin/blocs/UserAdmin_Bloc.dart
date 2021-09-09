import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitane_frontend/Admin/blocs/UserAdmin_Event.dart';
import 'package:mitane_frontend/Admin/blocs/UserAdmin_State.dart';
import 'package:mitane_frontend/Admin/repository/UserAdmin_Repository.dart';

class UserAdminBloc extends Bloc<UserAdminEvent, UserAdminState> {
  final UserAdminRepository userAdminRepository;

  UserAdminBloc({required this.userAdminRepository}) : super(UserAdminLoading());

  @override
  Stream<UserAdminState> mapEventToState(UserAdminEvent event) async* {
    if (event is UserAdminLoad) {
      print("Hey");
      yield UserAdminLoading();
      try {
        final userAdmins = await userAdminRepository.fetchAll();
        print("Yes");
        yield UserAdminOperationSuccess(userAdmins);
      } catch (_) {
        yield UserAdminOperationFailure();
      }
    }

    if (event is UserAdminCreate) {
      try {
        await userAdminRepository.create(event.user);
        final userAdmins = await userAdminRepository.fetchAll();
        yield UserAdminOperationSuccess(userAdmins);
      } catch (_) {
        yield UserAdminOperationFailure();
      }
    }

    if (event is UserAdminUpdate) {
      try {
        await userAdminRepository.update(event.user.id ?? "", event.user);
        final userAdmins = await userAdminRepository.fetchAll();
        yield UserAdminOperationSuccess(userAdmins);
      } catch (_) {
        yield UserAdminOperationFailure();
      }
    }

    if (event is UserAdminDelete) {
      try {
        await userAdminRepository.delete(event.id);
        final userAdmins = await userAdminRepository.fetchAll();
        yield UserAdminOperationSuccess(userAdmins);
      } catch (_) {
        yield UserAdminOperationFailure();
      }
    }
  }
}