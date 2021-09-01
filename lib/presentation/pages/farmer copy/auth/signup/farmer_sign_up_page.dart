import 'package:flutter/material.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/widgets/bubbles.dart';
import 'package:mitane_frontend/presentation/pages/farmer/auth/signup/farmer_sign_up2_page.dart';

class FarmerSignUp extends StatelessWidget {
  const FarmerSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Bubble(
              height: 160.0,
              width: 160.0,
            ),
            top: -5,
            left: -160,
          ),
          Positioned(
            child: Bubble(
              height: 300.0,
              width: 300,
            ),
            top: 120,
            left: 180,
          ),
          Positioned(
            child: Text(
              "Verify your phone number",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            top: 150,
            left: 50,
          ),
          Positioned(
            child: Text(
              "Confirm the country code and Enter \n          Your Phone number",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic),
            ),
            top: 200,
            left: 110,
          ),
          Positioned(
            child: Container(
              width: 300,
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(5),
                child: TextField(
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'ETH'),
                ),
              ),
            ),
            top: 280,
            left: 30,
          ),
          Positioned(
            child: Container(
              width: 300,
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(5),
                child: TextField(
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none,
                      ),
                      hintText: '+251'),
                ),
              ),
            ),
            top: 350,
            left: 30,
          ),
          Positioned(
            child: InkWell(
              onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FarmerSignUp2()),
                );
              }, // handle your onTap here
              child: Container(
                height: 46,
                width: 174,
                child: Align(child: Text('Next')),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x8CC63E).withOpacity(1),
                      Color(0x709E2F).withOpacity(1),
                    ]
                  ),
                ),
              )
            ),
            top: 450,
            left: 90,
          ),
        ],
      ),
    );
  }
}
