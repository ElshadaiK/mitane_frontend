import 'package:mitane_frontend/infrastructure/admin/productAdmin/data_provider/ProductAdmin_Data-Provider.dart';
import 'package:mitane_frontend/domain/admin/productAdmin/entity/ProductAdmin.dart';


class ProductAdminRepository {
  final UserAdminDataProvider dataProvider;
  ProductAdminRepository({required this.dataProvider});

  Future<Product> create(Product product) async {
    return this.dataProvider.create(product);
  }

  Future<Product> update(String name, Product product) async {
    return this.dataProvider.update(name, product);
  }

  Future<List<Product>> fetchAll() async {
    print("Fetched");
    return this.dataProvider.fetchAll();
  }

  Future<void> delete(String name) async {
    this.dataProvider.delete(name);
  }
}