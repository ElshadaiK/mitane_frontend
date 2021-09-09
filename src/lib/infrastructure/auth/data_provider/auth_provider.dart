import 'package:dio/dio.dart';
import 'package:mitane_frontend/domain/auth/entity/auth_model.dart';
// import 'package:http/http.dart' as http;
import 'package:mitane_frontend/infrastructure/core/data_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthDataProvider extends DataProvider {
  // final http.Client httpClient;
  final Dio dio;
  final baseUrl = 'http://192.168.127.1:3000';
  AuthDataProvider({required this.dio});

  Future<User> loginUser(Login login) async {
    final String phone = login.phone;
    final String password = login.password;
    var user;
    try {
      Response response = await dio.post("$baseUrl/auth/login",
          data: {'phone_no': phone, 'password': password});
      if (response.statusCode == 200 || response.statusCode == 204) {
        user = User.fromJson(response.data);
        saveUserOnLocal(user);
      } else {
        throw Exception("Invalid login");
      }
    } catch (e) {
      print(e);
      throw Exception("Failed login");
    }
    return user;
  }

  Future<bool> registerUser(Register register) async {
    final String name = register.name;
    final String phone = register.phone;
    final String confirm = register.confirm;
    final String role = register.role;
    final String password = register.password;

    String route = '$baseUrl/auth';
    switch (role) {
      case 'farmer':
        route += '/f/signup';
        break;
      case 'accessory trader':
        route += '/at/signup';
        break;
      case 'product trader':
        route += '/pt/signup';
        break;
      case 'tool trader':
        route += '/tt/signup';
        break;
      default:
        route += '/u/signup';
        break;
    }

    try {
      Response response = await dio.post(route, data: {
        'name': name,
        'phone_no': phone,
        'password': password,
        'repeat_password': confirm
      });
      print('here');
      if (response.statusCode == 200) {
        print(response.data);
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> saveUserOnLocal(User user) async {
    try {
      final storage = FlutterSecureStorage();
      await storage.write(key: "name", value: user.name);
      await storage.write(key: "phone", value: user.phone);
      await storage.write(key: "role", value: user.roles[0].toString());
      await storage.write(key: "password", value: user.password);
      await storage.write(key: "token", value: user.token);
      return true;
    } catch (e) {
      throw e;
    }
  }
}
