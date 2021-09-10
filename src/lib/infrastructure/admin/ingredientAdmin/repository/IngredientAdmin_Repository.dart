import 'package:mitane_frontend/infrastructure/admin/ingredientAdmin/data_provider/IngredientAdmin_Data-Provider.dart';
import 'package:mitane_frontend/domain/admin/ingredientAdmin/entity/IngredientAdmin.dart';


class IngredientAdminRepository {
  final IngredientAdminDataProvider dataProvider;
  IngredientAdminRepository({required this.dataProvider});

  Future<Ingredient> create(Ingredient ingredient) async {
    return this.dataProvider.create(ingredient);
  }

  Future<Ingredient> update(String id, Ingredient ingredient) async {
    return this.dataProvider.update(id, ingredient);
  }

  Future<List<Ingredient>> fetchAll() async {
    print("Fetched");
    return this.dataProvider.fetchAll();
  }

  Future<void> delete(String id) async {
    this.dataProvider.delete(id);
  }
}