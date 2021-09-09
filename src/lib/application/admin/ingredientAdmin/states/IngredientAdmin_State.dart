import 'package:equatable/equatable.dart';

abstract class IngredientAdminState extends Equatable {
  const IngredientAdminState();

  @override
  List<Object> get props => [];
}

class IngredientAdminLoading extends IngredientAdminState {}

class IngredientAdminOperationSuccess extends IngredientAdminState {
  final Iterable<dynamic> ingredients;

  IngredientAdminOperationSuccess([this.ingredients = const []]);

  @override
  List<Object> get props => [ingredients];
}

class IngredientAdminOperationFailure extends IngredientAdminState {}