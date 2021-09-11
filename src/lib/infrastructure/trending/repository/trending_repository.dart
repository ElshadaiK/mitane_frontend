

import 'package:mitane_frontend/infrastructure/trending/data_provider/trending_provider.dart';

class TrendingRepository{
  final TrendingProvider trendingProvider;
  
  TrendingRepository({required this.trendingProvider});

  Future<List<dynamic>> suggestionByPrice() async{
    final trendings = await trendingProvider.getSuggestionByPrice();
    if(trendings.length != 0) return trendings;
    return [];
  }
}