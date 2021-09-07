import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mitane_frontend/domain/entity/price_model.dart';

class PriceProvider {
  final Dio dio;

  PriceProvider({required this.dio});

  Future<dynamic> getPrice(String date) async {
    try {
      
      Response response =
          await dio.get("http://10.6.214.137:3000/price/$date");
      if (response.statusCode == 200) {
        final prices = response.data;
        return prices['data']
            .map((price) => PriceDaily(
                price: price['price_of_the_day'], product: price['product']))
            .toList();
      } else {
        return [EmptyPrice()];
      }
    } catch (e) {
      print(e);
      throw Exception("Error");
    }
  }
}
