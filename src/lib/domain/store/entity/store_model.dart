class Ingredient{
  final Map<String,dynamic> user;
  final List<Map<String,dynamic>> ingredient;
  final Map<String,dynamic> pricePerPnit;

  factory Ingredient.fromJson(Map<String,dynamic> json){
    return Ingredient(user:json['user'],ingredient:json['ingredients'],pricePerPnit:json['price_per_unit']);
  }

  Ingredient({required this.user, required this.ingredient, required this.pricePerPnit});

}
class  Machinery{
  final Map<String,dynamic> user;
  final List<Map<String,dynamic>> machinery;
  final Map<String,dynamic> pricePerPnit;

  factory Machinery.fromJson(Map<String,dynamic> json){
    return Machinery(user:json['user'],machinery:json['machinerys'],pricePerPnit:json['price_per_unit']);
  }

  Machinery({required this.user, required this.machinery, required this.pricePerPnit});

}
class Product{
  final Map<String,dynamic> category;
  final String name;

  factory Product.fromJson(Map<String,dynamic> json){
    return Product(category:json['user'],name:json['products']);
  }

  Product({required this.category, required this.name});

}

class EmptyProduct{}
class Store{
  final Map<String,dynamic> user;
  final List<Map<String,dynamic>> store;
  final Map<String,dynamic> pricePerUnit;
  final Map<String,dynamic> latitude;
  final Map<String,dynamic> longitude;

  factory Store.fromJson(Map<String,dynamic> json){
    return Store(user:json['user'],store:json['stores'],pricePerUnit:json['price_per_unit'],
    latitude:json['location[coordinates[1]]'], longitude:json['location[coordinates[0]]']);
  }

  Store({required this.user, required this.store, required this.pricePerUnit, 
  required this.latitude, required this.longitude});

}