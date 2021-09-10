import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitane_frontend/application/machinery/events/machinery_events.dart';
import 'package:mitane_frontend/application/machinery/states/machinery_state.dart';
import 'package:mitane_frontend/infrastructure/machinery/repository/machinery_repository.dart';

class MachineryBloc extends Bloc<MachineryEvent, MachineryState> {
  final MachineryRepository machineryRepository;

  MachineryBloc({required this.machineryRepository})
      : super(MachineryAdminLoading());

  @override
  Stream<MachineryState> mapEventToState(MachineryEvent event) async* {
    if (event is MachineryAdminLoad) {
      yield MachineryAdminLoading();
      try {
        final machineryAdmins = await machineryRepository.fetchAll();
        print("Successfully listed");
        yield MachineryAdminOperationSuccess(machineryAdmins);
      } catch (_) {
        yield MachineryAdminOperationFailure();
      }
    }

    if (event is MachineryAdminCreate) {
      try {
        await machineryRepository.create(event.machinery);
        print(event.machinery);
        final machineryAdmins = await machineryRepository.fetchAll();
        print("Successfully created and listed");
        yield MachineryAdminOperationSuccess(machineryAdmins);
      } catch (_) {
        yield MachineryAdminOperationFailure();
      }
    }

    if (event is MachineryAdminUpdate) {
      try {
        await machineryRepository.update(
            event.machinery.id ?? "", event.machinery);
        final machineryAdmins = await machineryRepository.fetchAll();
        print("Successfully updated and listed");
        yield MachineryAdminOperationSuccess(machineryAdmins);
      } catch (_) {
        yield MachineryAdminOperationFailure();
      }
    }

    if (event is MachineryAdminDelete) {
      try {
        await machineryRepository.delete(event.id);
        final machineryAdmins = await machineryRepository.fetchAll();
        print("Successfully deleted and listed");
        yield MachineryAdminOperationSuccess(machineryAdmins);
      } catch (_) {
        yield MachineryAdminOperationFailure();
      }
    }
  }
}
