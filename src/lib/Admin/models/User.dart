class User {
  final String? id;
  final String name;
  final double phoneNo;
  final String password;
  final List<dynamic> roles;

  User(
      {required this.id,
      required this.name,
      required this.phoneNo,
      required this.password,
      required this.roles});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['_id'],
        name: json['name'],
        phoneNo: json['phone_no'],
        roles: json['roles'],
        password: json['password']);
  }
}

// class UserEmpty{}