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
  final String user;
  final String id;
  final Map<String,dynamic> location;

  List<Map<String,dynamic>> productItems = [];
  List<Map<String,dynamic>> machineryItems = [];
  List<Map<String,dynamic>> ingredientItems = [];

  factory Store.fromJson(Map<String,dynamic> json){
    return Store(json['machinery_items'],json['ingredient_items'],json['product_items'],user:json['user'],id: json['_id'],location: json['location']);
  }

  Store(this.machineryItems, this.ingredientItems,this.productItems,{required this.user, required this.id,required this.location});

}

class StoreItem{
  final String? product;
  final double price;
  final int quantity;

  StoreItem({required this.price,required this.product,required this.quantity});
}