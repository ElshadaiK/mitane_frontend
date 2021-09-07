import 'package:mitane_frontend/domain/validation/auth/invalid_validation.dart';

class PhoneNumber {
  final String phoneNum;

  List<String> get props => [phoneNum];

  factory PhoneNumber(String phone) {

    return PhoneNumber._(phoneNum: validatePhone(phone));
  }

  PhoneNumber._({required this.phoneNum});

  static validatePhone(String phone) {
    if (phone.length != 10) {
      throw InvalidPhone(failedValue: "Phone nubmer length must be 10");
      
    } 
  }

  @override
  String toString() => 'phone number: {$phoneNum}';
}

class InvalidPhone extends InvalidCredential {
  final String failedValue;

  List<String> get props => [failedValue];
  InvalidPhone({required this.failedValue}):super(failedValue: failedValue);
}
