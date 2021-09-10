import 'package:http/http.dart';
import 'package:mitane_frontend/infrastructure/machinery/data_provider/machinery_provider.dart';
import 'package:mitane_frontend/domain/machinery/entity/machinery_model.dart';

class MachineryRepository {
  final MachineryProvider machineryProvider;

  MachineryRepository({required this.machineryProvider});
  Future getMachinery() async {
    final result = await machineryProvider.getMachinery();
    return result;
  }
  Future<bool> createMachinery(Machinery machine) async{
     final result = await machineryProvider.createMachinery(machine);
    if (result) return true;
    return false;
  }
   Future<bool> updateMachinery(Machinery machine) async{
     final result = await machineryProvider.updateMachinery(machine);
    if (result) return true;
    return false;
  }
   Future<bool> deleteMachinery(Machinery machine) async{
     final result = await machineryProvider.deleteMachinery(machine);
    if (result) return true;
    return false;
  }
}
