class Product{
  final String? id;
  final String name;
  final Map<String,dynamic> category;


  Product({required this.id, required this.name, required this.category});

  factory Product.fromJson(Map<String,dynamic> json){
    return Product(
      id: json['_id'],
      name: json['name'],
      category: json['category']);
  }


}