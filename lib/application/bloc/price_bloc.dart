import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitane_frontend/application/events/price_event.dart';
import 'package:mitane_frontend/application/states/price_state.dart';
import 'package:mitane_frontend/domain/entity/price_model.dart';
import 'package:mitane_frontend/infrastructure/repository/price_repository.dart';

class PriceBloc extends Bloc<PriceEvent, PriceState> {
  PriceRepository priceRepository = PriceRepository();

  PriceBloc() : super(PriceFetching());

  @override
  Stream<PriceState> mapEventToState(PriceEvent event) async* {
    if (event is PriceFetch) {
      DateTime date = DateTime.now();
      List<dynamic> price = await priceRepository.getPrice(date);
      if (price is List<dynamic>) {
        yield PriceFetched(priceDaily: price);
      }
      yield PriceFetchFailed();
    } else if (event is PriceCreate) {
    } else if (event is PriceUpdate) {
    } else if (event is PriceDelete) {}
    throw Exception("Event not found");
  }
}
