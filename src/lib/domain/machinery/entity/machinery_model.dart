class  Machinery{
  final Map<String,dynamic> user;
  final List<Map<String,dynamic>> machinery;
  final Map<String,dynamic> pricePerPnit;

  factory Machinery.fromJson(Map<String,dynamic> json){
    return Machinery(user:json['user'],machinery:json['machinerys'],pricePerPnit:json['price_per_unit']);
  }

  Machinery({required this.user, required this.machinery, required this.pricePerPnit});

}