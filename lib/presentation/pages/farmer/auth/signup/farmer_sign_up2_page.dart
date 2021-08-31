import 'package:flutter/material.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/widgets/bubbles.dart';
import 'package:mitane_frontend/presentation/pages/farmer/auth/signup/farmer_sign_up3_page.dart';

class FarmerSignUp2 extends StatelessWidget {
  const FarmerSignUp2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Bubble(
              height: 300.0,
              width: 300.0,
            ),
            top: -218,
            left: 95,
          ),
          Positioned(
            child: Bubble(
              height: 151.0,
              width: 150.0,
            ),
            top: 400,
            left: -165,
          ),
          Positioned(
            child: Text(
              "Tell us what you do",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            top: 200,
            left: 50,
          ),
          Positioned(
            child: Text(
              "Please pick your role",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic),
            ),
            top: 250,
            left: 110,
          ),
          Positioned(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FarmerSignUp3()),
                );
              },
              child: Container(
                height: 46,
                width: 174,
                child: Align(
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0x8CC63E).withOpacity(1),
                        Color(0x709E2F).withOpacity(1),
                      ]),
                ),
              ),
            ),
            top: 450,
            left: 90,
          ),
        ],
      ),
    );
  }
}
