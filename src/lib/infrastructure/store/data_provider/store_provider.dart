import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mitane_frontend/domain/price/entity/price_model.dart';
import 'package:mitane_frontend/domain/store/entity/store_model.dart';

class StoreProvider {
  final Dio dio;
  final baseUrl = 'http://192.168.137.1:3000';
  final storage = FlutterSecureStorage();
  StoreProvider({required this.dio});

  Future<dynamic> getSelfStore() async {
    final token = await storage.read(key: 'token');
    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['authorization'] = 'Bearer $token';
      final response = await dio.get("$baseUrl/store/self");
      if (response.statusCode == 200) {
        final data = response.data;
        print(data);
        return data;
      } else {
        return [];
      }

    }on Exception catch (e) {

      return [];
    }
  }

  Future<bool> createStore(Map<String, dynamic> store) async {
    final latitude = store['latitude'];
    final longitude = store['longitude'];
    final token = await storage.read(key: 'token');
    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['authorization'] = 'Bearer $token';
      final response = await dio.post("$baseUrl/store",
          data: {'latitude': latitude, 'longitude': longitude});
      print(response.data);
      if (response.statusCode == 200) return true;
      return false;
    } catch (e) {
      throw Exception();
    }
  }

  Future<List<dynamic>> getAllStores() async {
    final token = await storage.read(key: 'token');
    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['authorization'] = 'Bearer $token';
      final response = await dio.get("$baseUrl/store");
      if (response.statusCode == 200) {
        final data = response.data;
        print(data['docs']);
        return data['docs'];
      } else {
        return [];
      }

    }on Exception catch (e) {

      return [];
    }
  }

  Future<bool> getStoreById() async {
    try {
      return false;
    } catch (e) {
      return false;
    }
  }

// Products, ingredients, machineries for the home page
  Future<List<dynamic>> getAllItems() async {
    try {
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<List<dynamic>> getAnItem() async {
    try {
      return [];
    } catch (e) {
      return [];
    }
  }

  // Product, ingredient, machinery
  Future<bool> addAnItem(StoreItem item) async {
    final product = item.product;
    final price = item.price;
    final quantity = item.quantity;
    final token = await storage.read(key: 'token');
    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['authorization'] = 'Bearer $token';
      print('here');
      final response = await dio.post("$baseUrl/store/add_product",
          data: {'product': product, 'price': price, 'quantity': quantity});
      print(response.data);
      if (response.statusCode == 200) return true;
      return false;
    } catch (e) {
      return false;
    }
  }

  // Product, ingredient, machinery
  Future<bool> deleteAnItem() async {
    try {
      return false;
    } catch (e) {
      return false;
    }
  }

  // Product, ingredient, machinery
  Future<bool> updateAnItem() async {
    try {
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> clearStore() async {
    try {
      return false;
    } catch (e) {
      return false;
    }
  }
}
