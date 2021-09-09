import 'package:mitane_frontend/domain/auth/entity/auth_model.dart';
import 'package:mitane_frontend/infrastructure/auth/data_provider/auth_provider.dart';

class AuthRepository {
  final AuthDataProvider authDataProvider;

  AuthRepository({required this.authDataProvider});

  Future<User> signIn(Login login) async {
    print(login.phone);
    return await authDataProvider.loginUser(login);
  }

  Future<bool> signUp(Register register) async {
    switch(register.role){
      case '1':
        register.role = 'farmer';
        break;
      case '2':
        register.role = 'accesory trader';
        break;
      case '3':
        register.role = 'product trader';
        break;
      case '4':
        register.role = 'tool trader';
        break;
      default:
        register.role = 'user';
        break;
    }
    register.phone = '+251'+register.phone;
    return await authDataProvider.registerUser(register);
  }
}
