import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mitane_frontend/domain/product/entity/product_model.dart';

class ProductDataProvider {
  final Dio dio;
  final baseUrl = 'http://192.168.137.1:3000';

  ProductDataProvider({required this.dio});

  Future<Product> create(Product product) async {
    try {
      // dio.options.headers["authorization"] = AuthDataProvider.getToken().then((value) => value);
      final response = await dio.post("$baseUrl/products",
          data: jsonEncode({
            "name": product.name,
            "category": product.category,
          }));

      if (response.statusCode == 201) {
        return Product.fromJson(jsonDecode(response.data['data']));
      }
      print("Unsuccessful creation");
      return Product(id: "", name: "", category: "");
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<List<Product>> fetchAll() async {
    try {
      final response = await dio.get("$baseUrl/products");
      return (response.data['data'] as List).map((u) => Product.fromJson(u)).toList();
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Product> update(String name, Product product) async {
    try {
      // dio.options.headers["authorization"] = AuthDataProvider.getToken().then((value) => value);
      final response = await dio.put("$baseUrl/products/$name",
          data: jsonEncode({
            "id": product.id,
            "name": name,
            "category": product.category,
          }));

      if (response.statusCode == 200) {
        print("Successful updation");
        return Product.fromJson(jsonDecode(response.data['data']));
      }
      print("Unsuccessful updation");
      return Product(id: "", name: "", category: "");
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<void> delete(String name) async {
    // dio.options.headers["authorization"] = AuthDataProvider.getToken().then((value) => value);
    final response = await dio.delete("$baseUrl/products/$name");
    // final response = await http.delete(Uri.parse("$_baseUrl/$id"));
    if (response.statusCode != 204) {
      throw Exception("Failed to delete the user");
    }
    print("Successful deletion");
  }
}
