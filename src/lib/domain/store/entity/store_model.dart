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