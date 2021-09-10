import 'dart:async';
import 'package:dio/dio.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:mitane_frontend/application/ingredient/states/ingredient_state.dart';
import 'package:mitane_frontend/infrastructure/ingredient/data_provider/ingredient_provider.dart';
import 'package:mitane_frontend/application/ingredient/events/ingredient_event.dart';
import 'package:mitane_frontend/application/ingredient/bloc/ingredient_bloc.dart';
import 'package:mitane_frontend/infrastructure/ingredient/repository/ingredient_repository.dart';
import 'package:mitane_frontend/domain/ingredient/entity/ingredient_model.dart';
import 'package:test/test.dart';

class MockIngredientBloc extends MockBloc<IngredientEvent, IngredientState>
    implements IngredientBloc {}

class MockIngredientRepository
    extends MockBloc<IngredientEvent, IngredientState>
    implements IngredientRepository {}

void main() {
  group('GetIngredient', () {
    MockIngredientRepository ingredientRepository = MockIngredientRepository();
    IngredientBloc ingredientBloc =
        IngredientBloc(ingredientRepository: ingredientRepository);
    final ingredient = Ingredient(id: "1", name: "Teff", category: "Crop");
    setUp(() {
      ingredientRepository = MockIngredientRepository();
      ingredientBloc =
          IngredientBloc(ingredientRepository: ingredientRepository);
    });

    blocTest<IngredientBloc, IngredientState>(
        'emits [IngredientLoading,IngredientAdminOperationSuccess] when successful',
        build: () {
          final ingredients = ingredientRepository.fetchAll();
          final Dio dio = Dio();

          final IngredientRepository ingredientRepo = IngredientRepository(
              dataProvider: IngredientDataProvider(dio: dio));
          return IngredientBloc(ingredientRepository: ingredientRepo);
        },
        act: (bloc) => bloc.add(IngredientAdminLoad()),
        expect: [
          IngredientAdminLoading(),
          IngredientAdminOperationSuccess(ingredient),
          IngredientAdminOperationError()
        ]);
  });
}
