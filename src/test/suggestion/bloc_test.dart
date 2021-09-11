import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mitane_frontend/application/suggestion/bloc/suggestion_bloc.dart';
import 'package:mitane_frontend/application/suggestion/events/suggestion_events.dart';
import 'package:mitane_frontend/application/suggestion/states/suggestion_state.dart';
import 'package:mitane_frontend/infrastructure/suggestion/repository/suggestion_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockSuggestionRepository extends Mock implements SuggestionRepository{}

void main() {
  MockSuggestionRepository mockSuggestionRepository = MockSuggestionRepository();
   
   Future<List<dynamic>> createFutureDynamic() async {
    return [22,25];
  }
  Future<List<dynamic>> createFutureDynamicZ() async {
    return [];
  }
   blocTest<SuggestionBloc, SuggestionState>(
    'UserAdminLoad emits [UserAdminOperationSuccess] when Success',
    
    build: () {
      when(() => mockSuggestionRepository.SuggestionByWeather())
        .thenAnswer((realInvocation) => createFutureDynamic());
      return SuggestionBloc(suggestionRepository: mockSuggestionRepository);
    },
    act: (bloc) => bloc.add(FetchSuggestion()),
    expect: (){
      return [ isA<SuggestionFetching>(),isA<SuggestionFetched>()];
    },
  );

  blocTest<SuggestionBloc, SuggestionState>(
    'UserAdminLoad emits [UserAdminOperationSuccess] when failure',
    
    build: () {
      when(() => mockSuggestionRepository.SuggestionByWeather())
        .thenAnswer((realInvocation) => createFutureDynamicZ());
      return SuggestionBloc(suggestionRepository: mockSuggestionRepository);
    },
    act: (bloc) => bloc.add(FetchSuggestion()),
    expect: (){
      return [ isA<SuggestionFetching>(),isA<SuggestionFailed>()];
    },
  );


}
