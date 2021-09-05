import 'dart:convert';

import 'package:mitane_frontend/domain/entity/user_model.dart';
import 'package:mitane_frontend/domain/validation/auth/password_validation.dart';
import 'package:mitane_frontend/domain/validation/auth/phone_validation.dart';
import 'package:http/http.dart' as http;
import 'package:mitane_frontend/infrastructure/data_provider/data_provider.dart';

class AuthDataProvider extends DataProvider {
  final http.Client httpClient;

  AuthDataProvider({required this.httpClient});

  Future<User> loginUser(PhoneNumber phoneNum, Password psw) async {
    final String phone = phoneNum.phoneNum;
    final String password = psw.password;

    try {
      final response = await httpClient.post(
          Uri.http('192.168.1.103:3000', '/auth/login'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: jsonEncode(<String, dynamic>{
            'phone_no': '$phone',
            'password': "$password"
          }));
      if (response.statusCode == 200) {
        print("status fine");

        return User.fromJson(jsonDecode(response.body));
      } else {
        print("empty response");
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to login user.');
    }
    throw Exception('Failed to login user.');
  }

  bool logout() {
    return true;
  }

  Future<Register> registerUser(Register register) async {
    final response = await httpClient.post(Uri.http(baseUrl, '/u/signup'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'name': register.name,
          'phone_no': register.phone,
          'password': register.password
        }));
    return register;
  }
}
