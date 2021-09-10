
import 'package:dio/dio.dart';
import 'package:mitane_frontend/domain/price/entity/price_model.dart';

class PriceProvider {
  final Dio dio;
final baseUrl = 'http://localhost:3000';
  PriceProvider({required this.dio});

  Future<List<dynamic>> getPrice(String date) async {
    try {
      Response response = await dio.get("$baseUrl/price/$date");
      if (response.statusCode == 200) {
        if (response.data['count'] == 0) {
          return [EmptyPrice("No result")];
        }
        final prices = response.data['data']
            .map((price) => PriceDaily(
                price: price['price_of_the_day'], product: price['product']))
            .toList();
        return prices;
      } else {
        return [];
      }
    } catch (e) {
      return [EmptyPrice("No result")];
    }
  }

  Future<bool> addDailyPrice(PriceAdd priceAdd) async {
    final product = priceAdd.product;
    final price = priceAdd.price;
    try {
      final response = await dio
          .post("$baseUrl/price/$product", data: {'price': price});
      if (response.statusCode == 200) return true;
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteSpecificPrice(PriceAdd priceAdd) async {
    try {
      final response = await dio.post("$baseUrl/price",
          data: {'product': priceAdd.product, 'date': priceAdd.date});
      if (response.statusCode == 200) return true;
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> createProduct(ProductPrice productPrice) async {
    try {
      final response = await dio.post("$baseUrl/price", data: {
        'product': productPrice.product,
        'category': productPrice.category
      });
      if (response.statusCode == 200) return true;
      return false;
    } catch (e) {
      return false;
    }
  }
}
