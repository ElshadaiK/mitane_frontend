import 'package:dio/dio.dart';
import 'package:mitane_frontend/domain/price/entity/price_model.dart';
import 'package:mitane_frontend/infrastructure/price/data_provider/price_provider.dart';

class PriceRepository {
  PriceProvider priceProvider = PriceProvider(dio: Dio());
  PriceRepository();

  Future<List<dynamic>> getPrice(DateTime date) async {
    String year = date.year.toString();
    String month = date.month.toString();
    String day = date.day.toString();

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

  Future<bool> createProduct(ProductPrice productPrice)async{
    final result = await priceProvider.createProduct(productPrice);
    if(result) return true;
    return false;

  }

  Future<bool> addDailyPrice(PriceAdd priceAdd)async{

    final result = await priceProvider.addDailyPrice(priceAdd);

    if(result) return true;
    else return false;
  }

  Future<bool> deleteSpecificPrice(PriceAdd priceAdd) async{

    final result = await priceProvider.deleteSpecificPrice(priceAdd);
    if(result) return true;
    return false;
  }


}
