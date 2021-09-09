class Ingredient{
  final Map<String,dynamic> user;
  final List<Map<String,dynamic>> ingredient;
  final Map<String,dynamic> pricePerPnit;

  factory Ingredient.fromJson(Map<String,dynamic> json){
    return Ingredient(user:json['user'],ingredient:json['ingredients'],pricePerPnit:json['price_per_unit']);
  }

  Ingredient({required this.user, required this.ingredient, required this.pricePerPnit});

}