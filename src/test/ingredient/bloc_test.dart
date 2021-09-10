import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:bloc_test/bloc_test.dart';
import 'package:mitane_frontend/application/ingredient/states/ingredient_state.dart';
import 'package:mitane_frontend/infrastructure/ingredient/data_provider/ingredient_provider.dart';
import 'package:mitane_frontend/application/ingredient/events/ingredient_events.dart';
import 'package:mitane_frontend/application/ingredient/bloc/ingredient_bloc.dart';
import 'package:mitane_frontend/infrastructure/ingredient/repository/ingredient_repository.dart';
import 'package:mitane_frontend/domain/ingredient/entity/ingredient_model.dart';
import 'package:test/test.dart';

class MockIngredienBloc extends MockBloc<IngredientEvent, IngredientState> implements IngredientBloc{}
class MockIngredientRepository extends MockBloc<IngredientEvent, IngredientState> implements IngredientRepository{}
void main() {
  MockIngredientRepository mockIngredientRepository;
  MockIngredientBloc mockIngredientBloc;
  setUp(()
  {
    mockIngredientBloc = MockIngredientBloc();
    mockIngredientRepository = MockIngredientRepository();
  });
  group('GetIngredient', () {
    final ingredient = Ingredient(name:"Teff",category:"Crop")
    blocTest<IngredientBloc,IngredientState> (
  'emits [IngredientLoading,IngredientAdminOperationSuccess] when successful'
  build:(){
    final Dio dio = Dio();
   
    final IngredientRepository ingredientRepository = IngredientRepository(IngredientDataProvider(dio));
   
    when(mockIngredientRepository.fetchAll()).thenAnswer((_) async =>ingredient);
    return IngredientBloc(mockIngredientRepository);
  };
  act:(bloc) => bloc.add(IngredientAdminLoad('Teff','Crop')),
  expect: [
    IngredientAdminLoading(),
    IngredientAdminOperationSuccess(ingredient),
    IngredientAdminOperationError()

  ]




      )  
 
    
     
  };
  )
  }
  
  





