import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mitane_frontend/application/ingredient/states/ingredient_state.dart';
import 'package:mitane_frontend/infrastructure/ingredient/data_provider/ingredient_provider.dart';
import 'package:mitane_frontend/application/ingredient/events/ingredient_event.dart';
import 'package:mitane_frontend/application/ingredient/bloc/ingredient_bloc.dart';
import 'package:mitane_frontend/infrastructure/ingredient/repository/ingredient_repository.dart';
import 'package:mitane_frontend/domain/ingredient/entity/ingredient_model.dart';

import 'package:mocktail/mocktail.dart';

class MockIngredientBloc extends MockBloc<IngredientEvent, IngredientState>
    implements IngredientBloc {}

class MockIngredientRepository extends Mock implements IngredientRepository {}

void main() {
  MockIngredientRepository ingredientRepository = MockIngredientRepository();
  // IngredientBloc ingredientBloc =
  //     IngredientBloc(ingredientRepository: ingredientRepository);
  final ingredient = Ingredient(id: "1", name: "Teff", category: "Crop");
  Future<List<Ingredient>> createIngredients() async {
    return [Ingredient(id: "1", name: "Teff", category: "Crop")];
  }

  Future<Ingredient> createIngredient() async {
    return Ingredient(id: "1", name: "Teff", category: "Crop");
  }

  ;

  setUp(() {
    ingredientRepository = MockIngredientRepository();
    // ingredientBloc =
    //     IngredientBloc(ingredientRepository: ingredientRepository);
  });

  blocTest<IngredientBloc, IngredientState>(
      'emits [IngredientLoading,IngredientAdminOperationSuccess] when successful',
      build: () {
        when(() => ingredientRepository.fetchAll())
            .thenAnswer((invocation) => createIngredients());
        return IngredientBloc(ingredientRepository: ingredientRepository);
      },
      act: (bloc) => bloc.add(IngredientAdminLoad()),
      expect: () {
        return [
          IngredientAdminLoading(),
          isA<IngredientAdminOperationSuccess>()
        ];
      });

  blocTest<IngredientBloc, IngredientState>(
      'emits [IngredientLoading,IngredientAdminOperationFailure] when unsuccessful',
      build: () {
        return IngredientBloc(ingredientRepository: ingredientRepository);
      },
      act: (bloc) => bloc.add(IngredientAdminLoad()),
      expect: () {
        return [IngredientAdminLoading(), IngredientAdminOperationFailure()];
      });

  blocTest<IngredientBloc, IngredientState>(
      'emits [IngredientLoading,IngredientAdminOperationSuccess] when successful',
      build: () {
        when(() => ingredientRepository.create(ingredient))
            .thenAnswer((invocation) => createIngredient());
        when(() => ingredientRepository.fetchAll())
            .thenAnswer((invocation) => createIngredients());
        return IngredientBloc(ingredientRepository: ingredientRepository);
      },
      act: (bloc) => bloc.add(IngredientAdminCreate(ingredient)),
      expect: () {
        return [
         
          isA<IngredientAdminOperationSuccess>()
        ];
      });
}
