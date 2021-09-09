import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mitane_frontend/Admin/models/Models.dart';

class UserAdminDataProvider {
  static final String _baseUrl = "'http://127.0.0.1:3000/users/'";

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

  Future<User> fetchByCode() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Fetching Course by code failed");
    }
  }

  Future<List<User>> fetchAll() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final users = jsonDecode(response.body) as List;
      return users.map((c) => User.fromJson(c)).toList();
    } else {
      throw Exception("Could not fetch courses");
    }
  }

  Future<User> update(int id, User user) async {
    final response = await http.put(Uri.parse("$_baseUrl/$id"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "id": id,
          "name": user.name,
          "phoneNo": user.phoneNo,
          "roles": user.roles,
          "password": user.password
        }));

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not update the course");
    }
  }

  Future<void> delete(int id) async {
    final response = await http.delete(Uri.parse("$_baseUrl/$id"));
    if (response.statusCode != 204) {
      throw Exception("Field to delete the course");
    }
  }
}