

import 'package:mitane_frontend/infrastructure/suggestion/data_provider/suggestion_provider.dart';

class SuggestionRepository{
  final SuggestionProvider suggestionProvider;
  
  SuggestionRepository({required this.suggestionProvider});

  Future<List<dynamic>> suggestionByPrice() async{
    final suggestions = await suggestionProvider.getSuggestionByPrice();
    if(suggestions.length != 0) return suggestions;
    return [];
  }
}