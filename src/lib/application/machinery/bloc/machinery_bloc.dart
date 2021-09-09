
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitane_frontend/application/machinery/events/machinery_events.dart';
import 'package:mitane_frontend/application/machinery/states/machinery_state.dart';

class MachineryBloc extends Bloc<MachineryEvent,MachineryState>{

  MachineryBloc() : super(MachineryIntial());

  @override
  Stream<MachineryState> mapEventToState(MachineryEvent event) {

    throw UnimplementedError();
  }

}