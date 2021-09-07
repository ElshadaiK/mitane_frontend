import 'package:dio/dio.dart';
import 'package:mitane_frontend/domain/entity/user_model.dart';
// import 'package:http/http.dart' as http;
import 'package:mitane_frontend/infrastructure/data_provider/data_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthDataProvider extends DataProvider {
  // final http.Client httpClient;
  final Dio dio;

  AuthDataProvider({required this.dio});

  Future<User> loginUser(Login login) async {
    final String phone = login.phone;
    final String password = login.password;
    var user;
    try {
      Response response = await dio.post("http://10.6.157.15:3000/auth/login",
          data: {'phone_no': phone, 'password': password});
      print(response.data);
      if (response.statusCode == 200 || response.statusCode == 204) {
        user = User.fromJson(response.data);
      }
    } catch (e) {
      print(e);
      throw Exception("Failed login");
    }
    return user;
  }

  // Future<User> loginUser(Login login) async {
  //   final String phone = login.phone;
  //   final String password = login.password;

  //   try {
  //     final http.Response response = await httpClient.post(
  //         Uri.http('10.6.157.15:3000', '/auth/login'),
  //         headers: <String, String>{
  //           'Content-Type': 'application/json; charset=UTF-8'
  //         },
  //         body: jsonEncode(<String, dynamic>{
  //           'phone_no': '$phone',
  //           'password': "$password"
  //         }));
  //     if (response.statusCode == 200) {
  //       final res = jsonDecode(response.body);
  //       User user = User.fromJson(res);
  //       // if (await saveUserOnLocal(user)) return user;
  //       return user;
  //     } else {
  //       print("empty response");
  //     }
  //   } catch (e) {
  //     print(e);
  //     throw Exception('Failed to login user.');
  //   }
  //   throw Exception('Failed to login user.');
  // }

  // bool logout() {
  //   return true;
  // }

  Future<bool> registerUser(Register register) async {
    final String name = register.name;
    final String phone = register.phone;
    final String confirm = register.confirm;
    final String role = register.role;
    final String password = register.password;

    String route = 'http://10.6.157.15:3000/auth';
    switch (role) {
      case 'farmer':
        route += '/f/signup';
        break;
      case 'user':
        route += '/u/signup';
        break;
      case 'accessory trader':
        route += '/at/signup';
        break;
      case 'product trader':
        route += '/pt/signup';
        break;
    }
    try {
      Response response = await dio.post(route, data: {
        'name': name,
        'phone_no': phone,
        'password': password,
        'repeat_password': confirm
      });
      if (response.statusCode == 200) {
        print(response.data);
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      throw Exception("Register Failed");
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
