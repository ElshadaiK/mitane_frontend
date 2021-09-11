import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitane_frontend/application/suggestion/events/suggestion_events.dart';
import 'package:mitane_frontend/application/suggestion/states/suggestion_state.dart';
import 'package:mitane_frontend/domain/suggestion/entity/suggestion_model.dart';
import 'package:mitane_frontend/infrastructure/suggestion/repository/suggestion_repository.dart';

class SuggestionBloc extends Bloc<SuggestionEvent, SuggestionState> {
  final SuggestionRepository suggestionRepository;
  SuggestionBloc({required this.suggestionRepository})
      : super(SuggestionInitial());

  @override
  Stream<SuggestionState> mapEventToState(SuggestionEvent event) async* {
    yield SuggestionFetching();

    if (event is FetchSuggestion) {
      final result = await suggestionRepository.SuggestionByWeather();
      if (result.length != 0) {
        yield SuggestionFetched(suggestion: result);
      } else {
        yield SuggestionFailed();
      }
 
    }
  }
}
