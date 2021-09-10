import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitane_frontend/application/ingredient/events/IngredientAdmin_Event.dart';
import 'package:mitane_frontend/application/ingredient/states/IngredientAdmin_State.dart';
import 'package:mitane_frontend/infrastructure/ingredient/repository/IngredientAdmin_Repository.dart';

class IngredientAdminBloc extends Bloc<IngredientAdminEvent, IngredientAdminState> {
  final IngredientAdminRepository ingredientAdminRepository;

  IngredientAdminBloc({required this.ingredientAdminRepository}) : super(IngredientAdminLoading());

  @override
  Stream<IngredientAdminState> mapEventToState(IngredientAdminEvent event) async* {
    if (event is IngredientAdminLoad) {
      yield IngredientAdminLoading();
      try {
        final ingredientAdmins = await ingredientAdminRepository.fetchAll();
        print("Successfully listed");
        yield IngredientAdminOperationSuccess(ingredientAdmins);
      } catch (_) {
        yield IngredientAdminOperationFailure();
      }
    }

    if (event is IngredientAdminCreate) {
      try {
        await ingredientAdminRepository.create(event.ingredient);
        print(event.ingredient);
        final ingredientAdmins = await ingredientAdminRepository.fetchAll();
        print("Successfully created and listed");
        yield IngredientAdminOperationSuccess(ingredientAdmins);
      } catch (_) {
        yield IngredientAdminOperationFailure();
      }
    }

    if (event is IngredientAdminUpdate) {
      try {
        await ingredientAdminRepository.update(event.ingredient.id ?? "", event.ingredient);
        final ingredientAdmins = await ingredientAdminRepository.fetchAll();
        print("Successfully updated and listed");
        yield IngredientAdminOperationSuccess(ingredientAdmins);
      } catch (_) {
        yield IngredientAdminOperationFailure();
      }
    }

    if (event is IngredientAdminDelete) {
      try {
        await ingredientAdminRepository.delete(event.id);
        final ingredientAdmins = await ingredientAdminRepository.fetchAll();
        print("Successfully deleted and listed");
        yield IngredientAdminOperationSuccess(ingredientAdmins);
      } catch (_) {
        yield IngredientAdminOperationFailure();
      }
    }
  }
}