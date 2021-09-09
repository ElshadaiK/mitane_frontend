class User {
  final String name;
  final double phoneNo;
  final String password;
  final List<String> roles;

  User(
      {required this.name,
      required this.phoneNo,
      required this.password,
      required this.roles});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json['name'],
        phoneNo: json['phone_no'],
        roles: json['roles'],
        password: json['password']);
  }
}