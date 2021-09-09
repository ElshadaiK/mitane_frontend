import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mitane_frontend/domain/store/entity/store_model.dart';

class StoreProvider {
  final Dio dio;

  StoreProvider({required this.dio});

  Future<bool> getSelfStore(Store store) async {
    try {
      final response = await dio.get("http://localhost:3000/store/self");
      if (response.statusCode == 200) return true;
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> createStore(Store store) async {
    final latitude = store.latitude;
    final longitude = store.longitude;
    try {
      final response = await dio.post("http://localhost:3000/store/",
          data: {'latitude': latitude, 'longitude': longitude});
      if (response.statusCode == 200) return true;
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> getAllStores() async {
    try {
      return false;
    } catch (e) {
      return false;
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
  Future<bool> addAnItem() async {
    try {
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
