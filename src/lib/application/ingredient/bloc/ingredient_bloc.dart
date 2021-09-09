

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitane_frontend/application/ingredient/events/ingredient_event.dart';
import 'package:mitane_frontend/application/ingredient/states/ingredient_state.dart';
import 'package:mitane_frontend/application/machinery/states/machinery_state.dart';

class IngredientBloc extends Bloc<IngredientEvent,IngredientState>{

  IngredientBloc() : super(IngredientInitial());

  @override
  Stream<IngredientState> mapEventToState(IngredientEvent event) async*{

    yield IngredientFetching();

    if(event is FetchIngredient){

    }

    throw UnimplementedError();
  }

  
}

