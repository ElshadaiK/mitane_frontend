import 'package:flutter/material.dart';
import 'package:mitane_frontend/presentation/pages/signup/farmer_sign_up2_page.dart';
import 'package:mitane_frontend/presentation/pages/signup/farmer_sign_up_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FarmerSignUp2(),
    );
  }
}