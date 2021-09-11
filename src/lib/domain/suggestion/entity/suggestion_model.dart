class Suggestion {
  final String id;
  final Map<String, dynamic> category;
  final Map<String, dynamic> product;
  final Map<String, dynamic> weather;

  factory Suggestion.fromJson(Map<String,dynamic> json){
    return Suggestion(id: json['_id'],category: json['category'],product: json['product'],
    weather: json['weather']);
  }

  Suggestion({
    required this.id,
    required this.category,
    required this.product,
    required this.weather,
  });
}
