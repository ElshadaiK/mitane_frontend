import 'package:equatable/equatable.dart';
import 'package:mitane_frontend/domain/ingredient/entity/IngredientAdmin.dart';

abstract class IngredientAdminEvent extends Equatable {
  const IngredientAdminEvent();
}

class IngredientAdminLoad extends IngredientAdminEvent {
  const IngredientAdminLoad();

  @override
  List<Object> get props => [];
}

class IngredientAdminCreate extends IngredientAdminEvent {
  final Ingredient ingredient;

  const IngredientAdminCreate(this.ingredient);

  @override
  List<Object> get props => [ingredient];

  @override
  String toString() => 'User Created {User: $ingredient}';
}

class IngredientAdminUpdate extends IngredientAdminEvent {
  final Ingredient ingredient;

  const IngredientAdminUpdate(this.ingredient);

  @override
  List<Object> get props => [ingredient];

  @override
  String toString() => 'User Updated {User: $ingredient}';
}

class IngredientAdminDelete extends IngredientAdminEvent {
  final String id;

  const IngredientAdminDelete(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'User Deleted {User Id: $id}';
}