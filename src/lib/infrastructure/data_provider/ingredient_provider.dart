
import 'package:dio/dio.dart';

class IngredientProvider{

  final Dio dio;

  IngredientProvider({required this.dio});

  Future<List<dynamic>> getIngredient() async{

    throw Exception();
  }
}