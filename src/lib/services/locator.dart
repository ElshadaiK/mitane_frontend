
import 'package:get_it/get_it.dart';
import 'package:mitane_frontend/services/authservice.dart';
import 'package:mitane_frontend/services/navigator.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => NavigationService());
}