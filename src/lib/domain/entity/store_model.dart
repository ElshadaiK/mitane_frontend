class Store{
  final Map<String,dynamic> user;
  final List<Map<String,dynamic>> store;
  final Map<String,dynamic> pricePerUnit;

  factory Store.fromJson(Map<String,dynamic> json){
    return Store(user:json['user'],store:json['stores'],pricePerUnit:json['price_per_unit']);
  }

  Store({required this.user, required this.store, required this.pricePerUnit});

}