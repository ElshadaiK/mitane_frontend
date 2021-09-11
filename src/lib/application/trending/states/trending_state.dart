import 'package:mitane_frontend/domain/trending/entity/trending_model.dart';

abstract class TrendingState{}

class TrendingInitial extends TrendingState{}

class TrendingFetching extends TrendingState{}

class TrendingFetched extends TrendingState{
  final List<dynamic> trending;

  TrendingFetched({required this.trending});
}

class TrendingFailed extends TrendingState{}