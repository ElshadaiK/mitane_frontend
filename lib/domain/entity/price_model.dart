abstract class Price {}

class ProductPrice extends Price {
  final String product;
  final double category;
  ProductPrice({required this.product, required this.category});
}

class PriceDaily extends Price {
  final Map<String, dynamic> product;
  final List<dynamic> price;

  PriceDaily({required this.product, required this.price});

  factory PriceDaily.fromJson(Map<String, dynamic> json) {
    return PriceDaily(
        product: json['product'], price: json['price_of_the_day']);
  }
}

class PriceAdd extends Price {
  final String product;
  final String date;
  final double price;

  PriceAdd({required this.product, required this.price, required this.date});
}

class EmptyPrice extends Price {}
