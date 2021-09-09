import 'package:mitane_frontend/infrastructure/admin/userAdmin/data_provider/UserAdmin_Data-Provider.dart';
import 'package:mitane_frontend/domain/admin/userAdmin/entity/UserAdmin.dart';


class UserAdminRepository {
  final UserAdminDataProvider dataProvider;
  UserAdminRepository({required this.dataProvider});

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