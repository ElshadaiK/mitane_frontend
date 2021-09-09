import 'package:mitane_frontend/Admin/data-providers/UserAdmin_Data-Provider.dart';
import 'package:mitane_frontend/Admin/models/User.dart';

class UserAdminRepository {
  final UserAdminDataProvider dataProvider;
  UserAdminRepository({required this.dataProvider});

  Future<User> create(User course) async {
    return this.dataProvider.create(course);
  }

  Future<User> update(String id, User course) async {
    return this.dataProvider.update(id, course);
  }

  Future<List<User>> fetchAll() async {
    print("Fetched");
    return this.dataProvider.fetchAll();
  }

  Future<void> delete(String id) async {
    this.dataProvider.delete(id);
  }
}