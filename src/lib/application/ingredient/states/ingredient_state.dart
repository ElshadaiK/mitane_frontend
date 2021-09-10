import 'package:equatable/equatable.dart';

abstract class IngredientState extends Equatable {
  const IngredientState();

  @override
  List<Object> get props => [];
}

class IngredientAdminLoading extends IngredientState {}

class IngredientAdminOperationSuccess extends IngredientState {
  final Iterable<dynamic> ingredients;

  IngredientAdminOperationSuccess([this.ingredients = const []]);

  @override
  List<Object> get props => [ingredients];
}

class IngredientAdminOperationFailure extends IngredientState {}
