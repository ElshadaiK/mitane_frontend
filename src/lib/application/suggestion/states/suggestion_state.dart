import 'package:mitane_frontend/domain/suggestion/entity/suggestion_model.dart';

abstract class SuggestionState{}

class SuggestionInitial extends SuggestionState{}

class SuggestionFetching extends SuggestionState{}

class SuggestionFetched extends SuggestionState{
  final List<dynamic> suggestion;

  SuggestionFetched({required this.suggestion});
}

class SuggestionFailed extends SuggestionState{}