class Ingredient{
  final String? id;
  final String name;
  final String category;


  Ingredient({required this.id, required this.name, required this.category});

  factory Ingredient.fromJson(Map<String,dynamic> json){
    return Ingredient(
      id: json['_id'],
      name: json['name'],
      category: json['category'][0]['name']);
  }


}