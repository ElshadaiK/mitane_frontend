import 'package:dio/dio.dart';
import 'package:mitane_frontend/domain/machinery/entity/machinery_model.dart';

class MachineryProvider {
  final Dio dio;
  final baseUrl = 'http://192.168.127.1:3000/machinery';
  MachineryProvider({required this.dio});

  Future<List<dynamic>> getMachinery() async {
    try {
      Response response = await dio.get("$baseUrl/machinery");
      if (response.statusCode == 200) {
        var res = response.data;
        if (res['count'] == 0) {
          return ["No Machineries Found"];
        }
        return res
            .map((machineries) => Machinery(
                user: machineries['user'],
                machinery: machineries['machineries'],
                pricePerPnit: machineries["price_per_unit"]))
            .toList();
      }
      return  ["No Machineries Found"];
    } catch (e) {
       return ["No Machineries Found"];
    }
  }

  Future<bool> createMachinery(Machinery machine) async{
    try{
    Response response = await dio.post("$baseUrl/machinery",data: {"user":machine.user,"machineries":machine.machinery,"pricePerPnit":machine.pricePerPnit});
    if(response.statusCode == 200){
        return true;
      }
      return false;
               
    }
    catch (e) {
      return false;
    }
  }

  Future<bool> updateMachinery(Machinery machine) async{
    try{
      Response response = await dio.put("$baseUrl/machinery/${machine.machinery}",data: {"user":machine.user,"machinery":machine.machinery,"pricePerPnit":machine.pricePerPnit});

    if(response.statusCode == 200){
        return true;
      }
      return false;
               
    }
    catch (e) {
      return false;
    }
  }
  Future<bool> deleteMachinery(Machinery machine) async{
    try{
      Response response = await dio.delete("$baseUrl/machinery/${machine.machinery}");

    if(response.statusCode == 200){
        return true;
      }
      return false;
               
    }
    catch (e) {
      return false;
    }
  }

}
