import 'package:mitane_frontend/infrastructure/ingredient/data_provider/ingredient_provider.dart';
import 'package:mitane_frontend/domain/ingredient/entity/ingredient_model.dart';

class IngredientRepository {
  final IngredientDataProvider dataProvider;
  IngredientRepository({required this.dataProvider});

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
