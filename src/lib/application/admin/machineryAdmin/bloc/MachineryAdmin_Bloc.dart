import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitane_frontend/application/admin/machineryAdmin/events/MachineryAdmin_Event.dart';
import 'package:mitane_frontend/application/admin/machineryAdmin/states/MachineryAdmin_State.dart';
import 'package:mitane_frontend/infrastructure/admin/machineryAdmin/repository/MachineryAdmin_Repository.dart';

class MachineryAdminBloc extends Bloc<MachineryAdminEvent, MachineryAdminState> {
  final MachineryAdminRepository machineryAdminRepository;

  MachineryAdminBloc({required this.machineryAdminRepository}) : super(MachineryAdminLoading());

  @override
  Stream<MachineryAdminState> mapEventToState(MachineryAdminEvent event) async* {
    if (event is MachineryAdminLoad) {
      yield MachineryAdminLoading();
      try {
        final machineryAdmins = await machineryAdminRepository.fetchAll();
        print("Successfully listed");
        yield MachineryAdminOperationSuccess(machineryAdmins);
      } catch (_) {
        yield MachineryAdminOperationFailure();
      }
    }

    if (event is MachineryAdminCreate) {
      try {
        await machineryAdminRepository.create(event.machinery);
        print(event.machinery);
        final machineryAdmins = await machineryAdminRepository.fetchAll();
        print("Successfully created and listed");
        yield MachineryAdminOperationSuccess(machineryAdmins);
      } catch (_) {
        yield MachineryAdminOperationFailure();
      }
    }

    if (event is MachineryAdminUpdate) {
      try {
        await machineryAdminRepository.update(event.machinery.id ?? "", event.machinery);
        final machineryAdmins = await machineryAdminRepository.fetchAll();
        print("Successfully updated and listed");
        yield MachineryAdminOperationSuccess(machineryAdmins);
      } catch (_) {
        yield MachineryAdminOperationFailure();
      }
    }

    if (event is MachineryAdminDelete) {
      try {
        await machineryAdminRepository.delete(event.id);
        final machineryAdmins = await machineryAdminRepository.fetchAll();
        print("Successfully deleted and listed");
        yield MachineryAdminOperationSuccess(machineryAdmins);
      } catch (_) {
        yield MachineryAdminOperationFailure();
      }
    }
  }
}