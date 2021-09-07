import 'package:mitane_frontend/application/states/auth_state.dart';
import 'package:mitane_frontend/domain/entity/user_model.dart';
import 'package:mitane_frontend/domain/validation/auth/password_validation.dart';
import 'package:mitane_frontend/domain/validation/auth/phone_validation.dart';
import 'package:mitane_frontend/infrastructure/data_provider/auth_provider.dart';

class AuthRepository {
  final AuthDataProvider authDataProvider;

  AuthRepository({required this.authDataProvider});

  Future<User> signIn(PhoneNumber phone, Password password) async {
   
    return await authDataProvider.loginUser(phone,password);
  }

  Future<Register> signUp(Register register) async {
    return authDataProvider.registerUser(register);
  }
}
