import 'package:dio/dio.dart';
import 'package:mitane_frontend/infrastructure/data_provider/price_provider.dart';

class PriceRepository {
  PriceProvider priceProvider = PriceProvider(dio: Dio());
  PriceRepository();

  Future<List<dynamic>> getPrice(DateTime date) async {
    String year = date.year.toString();
    String month = '';
    String day = '';

    if (date.day < 10) {
      day = '0' + date.day.toString();
    }
    if (date.month < 10) {
      month = '0' + date.month.toString();
    }

    try {
      final result = await priceProvider.getPrice('$year-$month-$day');
      return result;
    } catch (e) {
      throw Exception();
    }
  }
}
