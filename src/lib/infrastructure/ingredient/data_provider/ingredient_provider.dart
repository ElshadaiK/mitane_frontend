import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mitane_frontend/domain/ingredient/entity/ingredient_model.dart';

class IngredientDataProvider {
  final Dio dio;
  IngredientDataProvider({required this.dio});

  Future<Ingredient> create(Ingredient ingredient) async {
    try {
      // dio.options.headers["authorization"] = AuthDataProvider.getToken().then((value) => value);
      final response = await dio.post("http://localhost:3000/ingredient",
          data: jsonEncode({
            "name": ingredient.name,
            "phoneNo": ingredient.category,
          }));

      if (response.statusCode == 201) {
        print(Ingredient.fromJson(jsonDecode(response.data)));
        return Ingredient.fromJson(jsonDecode(response.data));
      }
      print("Unsuccessful creation");
      return Ingredient(id: "", name: "", category: "");
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<List<Ingredient>> fetchAll() async {
    try {
      // There is a category with no value inside; ingredients route in the backend should be checked, 
      // the other choice is to remove category(if that is the case, it'll will work)
      final response = await dio.get("http://localhost:3000/ingredients");
      print(response);
      return (response.data['ingredients'] as List)
          .map((u) => Ingredient.fromJson(u))
          .toList();
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Ingredient> update(String id, Ingredient ingredient) async {
    try {
      // dio.options.headers["authorization"] = AuthDataProvider.getToken().then((value) => value);
      final response = await dio.put("http://localhost:3000/ingredient/$id",
          data: jsonEncode({
            "id": id,
            "name": ingredient.name,
            "category": ingredient.category,
          }));

      if (response.statusCode == 200) {
        print(Ingredient.fromJson(jsonDecode(response.data)));
        print("Successful updation");
        return Ingredient.fromJson(jsonDecode(response.data));
      }
      print("Unsuccessful updation");
      return Ingredient(id: "", name: "", category: "");
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<void> delete(String id) async {
    // dio.options.headers["authorization"] = AuthDataProvider.getToken().then((value) => value);
    final response = await dio.delete("http://localhost:3000/ingredient/$id");
    // final response = await http.delete(Uri.parse("$_baseUrl/$id"));
    if (response.statusCode != 204) {
      throw Exception("Failed to delete the user");
    }
    print("Successful deletion");
  }
}
