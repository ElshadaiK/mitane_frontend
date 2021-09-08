import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mitane_frontend/domain/entity/price_model.dart';

class PriceProvider {
  final Dio dio;

  PriceProvider({required this.dio});

  Future<List<dynamic>> getPrice(String date) async {
    try {
      Response response =
          await dio.get("http://localhost:3000/price/$date");
      if (response.statusCode == 200) {
        if(response.data['count']==0) {return [EmptyPrice("No result")];}
        final prices = response.data['data']
            .map((price) => PriceDaily(
                price: price['price_of_the_day'], product: price['product']))
            .toList();
        return prices;
      } else {
       throw Exception();
      }
    } catch (e) {
      return [EmptyPrice("No result")];
    }
  }
}
