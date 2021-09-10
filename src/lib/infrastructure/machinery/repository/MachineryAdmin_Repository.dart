import 'package:mitane_frontend/infrastructure/machinery/data_provider/MachineryAdmin_Data-Provider.dart';
import 'package:mitane_frontend/domain/machinery/entity/MachineryAdmin.dart';


class MachineryAdminRepository {
  final MachineryAdminDataProvider dataProvider;
  MachineryAdminRepository({required this.dataProvider});

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