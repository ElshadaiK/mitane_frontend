class Machinery {
  final String? id;
  final String name;

  Machinery({required this.id, required this.name});

  factory Machinery.fromJson(Map<String, dynamic> json) {
    return Machinery(
      id: json['_id'],
      name: json['name'],
    );
  }
}

class EmptyMachinery {}
