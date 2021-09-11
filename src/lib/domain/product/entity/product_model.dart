class Product{
  final String? id;
  final String name;
  final String category;


  Product({required this.id, required this.name, required this.category});

  factory Product.fromJson(Map<String,dynamic> json){
    return Product(
      id: json['_id'],
      name: json['name'],
      category: json['category'][0]['name']);
  }

}
