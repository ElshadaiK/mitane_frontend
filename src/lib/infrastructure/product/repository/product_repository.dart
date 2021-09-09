import 'package:location/location.dart';
import 'package:mitane_frontend/domain/product/entity/product_model.dart';
import 'package:mitane_frontend/infrastructure/product/data_provider/product_provider.dart';

import '../../core/get_location.dart';

class ProductRepository {
  final ProductProvider productProvider;

  ProductRepository({required this.productProvider});

  Future<List<dynamic>> getProduct() async {
    LocationData loc = await GetLocation.getLocation();
    final latitude = loc.latitude;
    final longitude = loc.longitude;

    return await productProvider.getProduct();
  }

  Future<bool> createProduct(Product product) async {

    final result = await productProvider.createProduct(product);
    if (result) return true;
    return false;
  }
}
