
abstract class Authentication{}

class Register extends Authentication{
  final String name;
  final String phone;
  final String password;
  final String confirm;
  final String role;
  Register({required this.name, required this.phone,required this.password,required this.confirm,required this.role});

  List<Object> get props => [name,phone,password,confirm,role];

  factory Register.fromJson(Map<String,dynamic> json){
      return Register(name: json['name'],phone: json['phone_no'],password: json['password'],confirm: json['confirm'],role: json['roles']);
  }

  @override
  String toString()=> 'User {name: $name, phone: $phone} confirm: $confirm';
}

class Login extends Authentication{
  final String phone;
  final String password;
  Login({required this.phone, required this.password});
}

class User extends Authentication{
  final String name;
  final String token;
  final String phone;
  final List<dynamic> roles;
  final String password;

  User({required this.name, required this.token, required this.phone, required this.roles, required this.password});

  factory User.fromJson(Map<String,dynamic> json){

    return User(name: json['name'],phone: json['phone_no'],password:json['password'],roles: json['roles'],token: json['token']);
  }
}