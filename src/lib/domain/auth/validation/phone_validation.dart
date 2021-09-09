import 'package:mitane_frontend/domain/auth/validation/invalid_validation.dart';

class PhoneNumber {
  final String phoneNum;

  List<String> get props => [phoneNum];

  factory PhoneNumber(String phone) {
    return PhoneNumber._(phoneNum: validatePhone(phone));
  }

  PhoneNumber._({required this.phoneNum});

  static validatePhone(String phone) {
    const phoneRegex = r"""^[0-9]{10}$ """;
    if (!(RegExp(phoneRegex).hasMatch(phone))) {
      throw InvalidPhone(failedValue: "Phone nubmer length must be valid");
    }
  }

  @override
  String toString() => 'phone number: {$phoneNum}';
}

class InvalidPhone extends InvalidCredential {
  final String failedValue;

  List<String> get props => [failedValue];
  InvalidPhone({required this.failedValue}) : super(failedValue: failedValue);
}
