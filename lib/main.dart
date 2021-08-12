import 'package:flutter/material.dart';
import 'package:mitane_frontend/presentation/pages/signup/farmer_sign_up_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FarmerSignUp(),
    );
  }
}