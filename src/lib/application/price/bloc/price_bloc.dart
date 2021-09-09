// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mitane_frontend/application/price/events/price_event.dart';
// import 'package:mitane_frontend/application/price/states/price_state.dart';
// import 'package:mitane_frontend/domain/entity/price_model.dart';
// import 'package:mitane_frontend/infrastructure/repository/price_repository.dart';

// class PriceBloc extends Bloc<PriceEvent, PriceState> {
//   PriceRepository priceRepository = PriceRepository();

//   PriceBloc() : super(PriceFetching());

//   @override
//   Stream<PriceState> mapEventToState(PriceEvent event) async* {
//     if (event is PriceFetch) {
//       DateTime date = DateTime.now();
//       try {
//         final price = await priceRepository.getPrice(date);
//       if (price is List<dynamic>) {
//         if(price[0] is PriceDaily)
//           yield PriceFetched(priceDaily: price);
//         else
//           yield PriceFetchFailed();
//       } 
//       } catch (e) {
//         yield PriceFetchFailed();
//       }
//     } else if (event is PriceCreate) {
//     } else if (event is PriceUpdate) {
//     } else if (event is PriceDelete) {}
//   }
// }
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:mitane_frontend/application/price/events/price_event.dart';
import 'package:mitane_frontend/application/price/states/price_state.dart';
import 'package:mitane_frontend/domain/entity/price_model.dart';
import 'package:mitane_frontend/infrastructure/price/repository/price_repository.dart';

class PriceBloc extends Bloc<PriceEvent, PriceState> {
  PriceRepository priceRepository = PriceRepository();

  PriceBloc() : super(PriceFetching());

  @override
  Stream<PriceState> mapEventToState(PriceEvent event) async* {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();

    if (event is PriceFetch) {
      DateTime date = DateTime.now();
      try {
        final price = await priceRepository.getPrice(date);
        if (price is List<dynamic>) {
          if (price[0] is PriceDaily)
            yield PriceFetched(priceDaily: price);
          else
            yield PriceFetchFailed();
        }
      } catch (e) {
        yield PriceFetchFailed();
      }
    } else if (event is PriceCreate) {
    } else if (event is PriceUpdate) {
    } else if (event is PriceDelete) {}
  }
}
