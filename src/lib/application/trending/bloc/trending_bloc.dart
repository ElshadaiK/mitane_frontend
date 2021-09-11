import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitane_frontend/application/trending/events/trending_events.dart';
import 'package:mitane_frontend/application/trending/states/trending_state.dart';
import 'package:mitane_frontend/domain/trending/entity/trending_model.dart';
import 'package:mitane_frontend/infrastructure/trending/repository/trending_repository.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  final TrendingRepository trendingRepository;
  TrendingBloc({required this.trendingRepository})
      : super(TrendingInitial());

  @override
  Stream<TrendingState> mapEventToState(TrendingEvent event) async* {
    yield TrendingFetching();

    if (event is FetchTrending) {
      final result = await trendingRepository.suggestionByPrice();
      if (result.length != 0) {
        yield TrendingFetched(trending: result);
      } else {
        yield TrendingFailed();
      }
 
    }
  }
}
