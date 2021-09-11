import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mitane_frontend/application/trending/bloc/trending_bloc.dart';
import 'package:mitane_frontend/application/trending/events/trending_events.dart';
import 'package:mitane_frontend/application/trending/states/trending_state.dart';
import 'package:mitane_frontend/infrastructure/trending/repository/trending_repository.dart';
import 'package:mitane_frontend/infrastructure/trending/repository/trending_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockTrendingRepository extends Mock implements TrendingRepository {}

void main() {
  MockTrendingRepository mockSuggestionRepository = MockTrendingRepository();

  Future<List<dynamic>> createFutureDynamic() async {
    return [22, 25];
  }

  Future<List<dynamic>> createFutureDynamicZ() async {
    return [];
  }

  blocTest<TrendingBloc, TrendingState>(
    'UserAdminLoad emits [UserAdminOperationSuccess] when Success',
    build: () {
      when(() => mockSuggestionRepository.suggestionByPrice())
          .thenAnswer((realInvocation) => createFutureDynamic());
      return TrendingBloc(trendingRepository: mockSuggestionRepository);
    },
    act: (bloc) => bloc.add(FetchTrending()),
    expect: () {
      return [isA<TrendingFetching>(), isA<TrendingFetched>()];
    },
  );

  blocTest<TrendingBloc, TrendingState>(
    'UserAdminLoad emits [UserAdminOperationSuccess] when failure',
    build: () {
      when(() => mockSuggestionRepository.suggestionByPrice())
          .thenAnswer((realInvocation) => createFutureDynamicZ());
      return TrendingBloc(trendingRepository: mockSuggestionRepository);
    },
    act: (bloc) => bloc.add(FetchTrending()),
    expect: () {
      return [isA<TrendingFetching>(), isA<TrendingFailed>()];
    },
  );
}
