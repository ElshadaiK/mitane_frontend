class Product{
  final Map<String,dynamic> category;
  final String name;

  factory Product.fromJson(Map<String,dynamic> json){
    return Product(category:json['user'],name:json['products']);
  }

  Product({required this.category, required this.name});

}

class EmptyProduct{}