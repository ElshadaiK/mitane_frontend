

import 'package:mitane_frontend/infrastructure/suggestion/data_provider/suggestion_provider.dart';

class SuggestionRepository{
  final SuggestionProvider suggestionProvider;
  
  SuggestionRepository({required this.suggestionProvider});

  Future<List<dynamic>> SuggestionByWeather() async{
    final suggestions = await suggestionProvider.getSuggestionByWeather();
    if(suggestions.length != 0) return suggestions;
    return [];
  }
}