import 'package:mitane_frontend/application/events/price_event.dart';
import 'package:mitane_frontend/domain/entity/price_model.dart';

abstract class PriceState {}

class PriceFetching extends PriceState {}

class PriceFetched extends PriceState {
  final List<dynamic> priceDaily;
  PriceFetched({required this.priceDaily});
}

class PriceAdding extends PriceState {}

class PriceUpdating extends PriceState {}

class PriceDeleting extends PriceState {}

class PriceFetchFailed extends PriceState {}
