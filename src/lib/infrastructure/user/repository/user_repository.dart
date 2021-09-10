import 'package:mitane_frontend/infrastructure/user/data_provider/user_provider.dart';
import 'package:mitane_frontend/domain/user/entity/user_model.dart';

class UserRepository {
  final UserDataProvider dataProvider;
  UserRepository({required this.dataProvider});

  Future<User> create(User user) async {
    return this.dataProvider.create(user);
  }

  Future<User> update(String id, User user) async {
    return this.dataProvider.update(id, user);
  }

  Future<List<User>> fetchAll() async {
    print("Fetched");
    return this.dataProvider.fetchAll();
  }

  Future<void> delete(String id) async {
    this.dataProvider.delete(id);
  }
}
