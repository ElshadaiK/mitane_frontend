import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitane_frontend/application/ingredient/events/ingredient_event.dart';
import 'package:mitane_frontend/application/ingredient/states/ingredient_state.dart';
import 'package:mitane_frontend/infrastructure/ingredient/repository/ingredient_repository.dart';

class IngredientBloc extends Bloc<IngredientEvent, IngredientState> {
  final IngredientRepository ingredientRepository;

  IngredientBloc({required this.ingredientRepository})
      : super(IngredientAdminLoading());

  @override
  Stream<IngredientState> mapEventToState(IngredientEvent event) async* {
    if (event is IngredientAdminLoad) {
      yield IngredientAdminLoading();
      try {
        final ingredientAdmins = await ingredientRepository.fetchAll();
        print("Successfully listed");
        yield IngredientAdminOperationSuccess(ingredientAdmins);
      } catch (_) {
        yield IngredientAdminOperationFailure();
      }
    }

    if (event is IngredientAdminCreate) {
      try {
        await ingredientRepository.create(event.ingredient);
        print(event.ingredient);
        final ingredientAdmins = await ingredientRepository.fetchAll();
        print("Successfully created and listed");
        yield IngredientAdminOperationSuccess(ingredientAdmins);
      } catch (_) {
        yield IngredientAdminOperationFailure();
      }
    }

    if (event is IngredientAdminUpdate) {
      try {
        await ingredientRepository.update(
            event.ingredient.id ?? "", event.ingredient);
        final ingredientAdmins = await ingredientRepository.fetchAll();
        print("Successfully updated and listed");
        yield IngredientAdminOperationSuccess(ingredientAdmins);
      } catch (_) {
        yield IngredientAdminOperationFailure();
      }
    }

    if (event is IngredientAdminDelete) {
      try {
        await ingredientRepository.delete(event.id);
        final ingredientAdmins = await ingredientRepository.fetchAll();
        print("Successfully deleted and listed");
        yield IngredientAdminOperationSuccess(ingredientAdmins);
      } catch (_) {
        yield IngredientAdminOperationFailure();
      }
    }
  }
}
