abstract class Price {
  final List<dynamic> field;

  Price(this.field);
}

class ProductPrice extends Price {
  final String product;
  final double category;
  ProductPrice({required this.product, required this.category})
      : super([product, category]);
}

class PriceDaily extends Price {
  final Map<String, dynamic> product;
  final List<dynamic> price;

  List<dynamic> get props => [product, price];

  PriceDaily({required this.product, required this.price})
      : super([product, price]);

  factory PriceDaily.fromJson(Map<String, dynamic> json) {
    return PriceDaily(
        product: json['product'], price: json['price_of_the_day']);
  }
}

class PriceAdd extends Price {
  final String product;
  final String date;
  final double price;

  List<dynamic> get props => [product, date, price];

  PriceAdd({required this.product, required this.price, required this.date})
      : super([product, date, price]);
}

class EmptyPrice extends Price {
  final String empty;

  EmptyPrice(this.empty) : super([empty]);
}
