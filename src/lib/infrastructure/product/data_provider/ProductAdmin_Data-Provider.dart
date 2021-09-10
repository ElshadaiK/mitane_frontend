import 'dart:convert';
import 'dart:html';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:mitane_frontend/domain/product/entity/ProductAdmin.dart';
import 'package:mitane_frontend/infrastructure/auth/data_provider/auth_provider.dart';

class ProductAdminDataProvider {

  final Dio dio;
  ProductAdminDataProvider({required this.dio});

  Future<Product> create(Product product) async {
    try {
      // dio.options.headers["authorization"] = AuthDataProvider.getToken().then((value) => value);
      final response = await dio.post("http://localhost:3000/products",
          data: jsonEncode({
            "name": product.name,
            "phoneNo": product.category,
          }));

      if (response.statusCode == 201) {
        print(Product.fromJson(jsonDecode(response.data)));
        return Product.fromJson(jsonDecode(response.data));
      }
      print("Unsuccessful creation");
      return Product(id: "", name: "", category: "");
    } catch(e) {
      print(e);
      throw e;
    }
  }


  Future<List<Product>> fetchAll() async {

    try {
      final response = await dio.get("http://localhost:3000/products");
      return (response.data as List)
        .map((u) => Product.fromJson(u))
        .toList();
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Product> update(String name, Product product) async {
    try {
      // dio.options.headers["authorization"] = AuthDataProvider.getToken().then((value) => value);
      final response = await dio.put("http://localhost:3000/products/$name",
          data: jsonEncode({
            "id": product.id,
            "name": name,
            "category": product.category,
          }));

      if (response.statusCode == 200) {
        print(Product.fromJson(jsonDecode(response.data)));
        print("Successful updation");
        return Product.fromJson(jsonDecode(response.data));
      }
      print("Unsuccessful updation");
      return Product(id: "", name: "", category: "");
    } catch(e) {
      print(e);
      throw e;
    }

  }

  Future<void> delete(String name) async {
    // dio.options.headers["authorization"] = AuthDataProvider.getToken().then((value) => value);
    final response = await dio.delete("http://localhost:3000/products/$name");    
    // final response = await http.delete(Uri.parse("$_baseUrl/$id"));
    if (response.statusCode != 204) {
      throw Exception("Failed to delete the user");
    }
    print("Successful deletion");
  }
}