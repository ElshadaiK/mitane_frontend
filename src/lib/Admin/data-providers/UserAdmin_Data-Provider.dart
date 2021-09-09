import 'dart:convert';
import 'dart:html';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:mitane_frontend/Admin/models/Models.dart';
import 'package:mitane_frontend/infrastructure/auth/data_provider/auth_provider.dart';

class UserAdminDataProvider {
  static final String _baseUrl = "http://localhost:3000/users";

  final Dio dio;
  UserAdminDataProvider({required this.dio});

  Future<User> create(User user) async {
    final http.Response response = await http.post(Uri.parse(_baseUrl),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "name": user.name,
          "phoneNo": user.phoneNo,
          "roles": user.roles,
          "password": user.password
        }));

    if (response.statusCode == 201) {
      return User.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed to create course");
    }
  }

  // Future<User> fetchByCode() async {
  //   final response = await http.get(Uri.parse(_baseUrl));

  //   if (response.statusCode == 200) {
  //     return User.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception("Fetching Course by code failed");
  //   }
  // }


  Future<List<User>> fetchAll() async {

    try {
      final response = await dio.get("http://localhost:3000/users");
      return (response.data as List)
        .map((u) => User.fromJson(u))
        .toList();
    } catch (e) {
      print(e);
      throw e;
    }
  }

  // Future<List<User>> fetchAll() async {
  //   // return [User(id: "0", name: "name", phoneNo: 5789929282, password: "password", roles: ["heeb"]),
  //   // User(id: "1", name: "named", phoneNo: 2489008653, password: "password1", roles: ["roles"])];
  //   try {
  //     final response = await http.get(Uri.parse(_baseUrl));
  //     if (response.statusCode == 200) {
  //       // print(response.body);
  //       final users = jsonDecode(response.body) as List;
  //       print("Success");
  //       print(users.map((e) => User.fromJson(e)).toList());
  //       return users.map((c) => User.fromJson(c)).toList();
  //     } 
  //     print(response.statusCode);
  //     return [];
  //   } catch (e) {
  //     print(e);
  //     return [];
  //   }
  // }

  Future<User> update(String id, User user) async {
    // final response = await http.put(Uri.parse("$_baseUrl/$id"),
    //     headers: <String, String>{"Content-Type": "application/json"},
    //     body: jsonEncode({
    //       "id": id,
    //       "name": user.name,
    //       "phoneNo": user.phoneNo,
    //       "roles": user.roles,
    //       "password": user.password
    //     }));

    // if (response.statusCode == 200) {
    //   return User.fromJson(jsonDecode(response.body));
    // } else {
    //   throw Exception("Could not update the course");
    // }
    return user;
  }

  Future<void> delete(String id) async {
    // final response = await http.delete(Uri.parse("$_baseUrl/$id"));
    // if (response.statusCode != 204) {
    //   throw Exception("Field to delete the course");
    // }
  }
}