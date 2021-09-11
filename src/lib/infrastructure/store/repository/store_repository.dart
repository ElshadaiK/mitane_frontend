import 'package:location/location.dart';
import 'package:mitane_frontend/domain/store/entity/store_model.dart';
import 'package:mitane_frontend/infrastructure/store/data_provider/store_provider.dart';

class StoreRepository {
  final StoreProvider storeProvider;
  StoreRepository({required this.storeProvider});

  Future<bool> createStore() async {
    try {
      final loc = await location();
      final result = await storeProvider
          .createStore({'longitude': loc.longitude, 'latitude': loc.latitude});
      return true;
    }on Exception catch (e) {
      throw e;
    }
  }

  Future<dynamic> getSelfStore() async {
    try {
      final result = await storeProvider.getSelfStore();
      return result;
    } catch (e) {
      return [];
    }
  }
  Future<List<dynamic>> getAllStore() async {
    try {
      final result = await storeProvider.getAllStores();
      return result;
    } catch (e) {
      return [];
    }
  }

  Future<bool> addItem(StoreItem item) async {
    try {
      final result = await storeProvider.addAnItem(item);
      return true;
    } catch (e) {
      throw Exception();
    }
  }

  Future<dynamic> location() async {
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

    return _locationData;
  }
}
