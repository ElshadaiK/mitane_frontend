
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mitane_frontend/domain/trending/entity/trending_model.dart';

class TrendingProvider {
  final Dio dio;
  final baseUrl = 'http://192.168.137.1:3000';
  TrendingProvider({
    required this.dio,
  });

  Future<List<dynamic>> getSuggestionByPrice() async{

    try {
      final response = await dio.get('$baseUrl/suggestion/price');
    if(response.statusCode == 200){
      if(response.data['data'].length == 0) return [];
      final data = response.data['data'];
      final suggestions = data.map((suggestion)=>Trending.fromJson(suggestion)).toList();   
      return suggestions;

    }
    } catch (e) {
      print(e);
      return [];

    }
    return [];


  }

}
