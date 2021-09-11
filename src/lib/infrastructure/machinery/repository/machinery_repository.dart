import 'package:http/http.dart';
import 'package:mitane_frontend/infrastructure/machinery/data_provider/machinery_provider.dart';
import 'package:mitane_frontend/domain/machinery/entity/machinery_model.dart';

class MachineryRepository {
  final MachineryDataProvider dataProvider;
  MachineryRepository({required this.dataProvider});

  Future<Machinery> create(Machinery machinery) async {
    return this.dataProvider.create(machinery);
  }

  Future<Machinery> update(String id, Machinery machinery) async {
    return this.dataProvider.update(id, machinery);
  }

  Future<List<Machinery>> fetchAll() async {
    print("Fetched");
    return this.dataProvider.fetchAll();
  }

  Future<void> delete(String id) async {
    this.dataProvider.delete(id);
  }
}
