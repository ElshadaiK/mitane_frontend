import 'package:dio/dio.dart';
import 'package:mitane_frontend/infrastructure/data_provider/price_provider.dart';

class PriceRepository {
  PriceProvider priceProvider = PriceProvider(dio: Dio());
  PriceRepository();

  Future<dynamic> getPrice(DateTime date) async {
    String year = date.year.toString();
    String month = date.month.toString();
    String day = date.day.toString();
    return await priceProvider.getPrice('$year-0$month-06');
  }
}
