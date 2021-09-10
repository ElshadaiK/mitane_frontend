import 'package:equatable/equatable.dart';
import 'package:mitane_frontend/domain/ingredient/entity/ingredient_model.dart';

abstract class IngredientEvent extends Equatable {
  const IngredientEvent();
}

class IngredientAdminLoad extends IngredientEvent {
  const IngredientAdminLoad();

  @override
  List<Object> get props => [];
}

class IngredientAdminCreate extends IngredientEvent {
  final Ingredient ingredient;

  const IngredientAdminCreate(this.ingredient);

  @override
  List<Object> get props => [ingredient];

  @override
  String toString() => 'User Created {User: $ingredient}';
}

class IngredientAdminUpdate extends IngredientEvent {
  final Ingredient ingredient;

  const IngredientAdminUpdate(this.ingredient);

  @override
  List<Object> get props => [ingredient];

  @override
  String toString() => 'User Updated {User: $ingredient}';
}

class IngredientAdminDelete extends IngredientEvent {
  final String id;

  const IngredientAdminDelete(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'User Deleted {User Id: $id}';
}
