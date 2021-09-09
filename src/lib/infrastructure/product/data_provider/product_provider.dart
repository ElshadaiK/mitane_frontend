import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mitane_frontend/domain/entity/product_model.dart';

class ProductProvider {
  final Dio dio;
  ProductProvider({required this.dio});

  Future<List<dynamic>> getProduct() async {

    try {
      final response = await dio.get("http://localhost:3000/products");
      if(response.statusCode == 200){
        if(response.data['count'] == 0) return [EmptyProduct()];
        final products = response.data.map((product)=> Product(category: product['category'],name: product['name'])).toList();
        return products;
      }
      return[EmptyProduct()];
    } catch (e) {
      return [EmptyProduct()];
    }
  }
  Future<bool> createProduct(Product product) async {

    try {
      final response = await dio.post("http://localhost:3000/products", data: {'product':product.name,'category':product.category});
      if(response.statusCode == 200){
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
