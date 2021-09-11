class Trending {
  final String id;
  final Map<String, dynamic> category;
  final Map<String, dynamic> product;
  final List<dynamic> price;
  final double lastPrice;

  factory Trending.fromJson(Map<String,dynamic> json){
    return Trending(id: json['_id'],category: json['category'],product: json['product'],lastPrice: json['last_price'],price: json['price_of_the_day']);
  }

  Trending({
    required this.id,
    required this.category,
    required this.price,
    required this.product,
    required this.lastPrice,
  });
}
