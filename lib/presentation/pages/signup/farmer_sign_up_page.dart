import 'package:flutter/material.dart';
import 'package:mitane_frontend/presentation/pages/signup/widgets/bubbles.dart';

class FarmerSignUp extends StatelessWidget {
  const FarmerSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Bubble(
              height: MediaQuery.of(context).size.height * 0.189,
              width: (MediaQuery.of(context).size.width * 0.410),
            ),
            top: -MediaQuery.of(context).size.height * 0.005,
            left: -(MediaQuery.of(context).size.width * 0.410), //160
          ),
          Positioned(
            child: Bubble(
              height: (MediaQuery.of(context).size.height * 0.355), //300.0
              width: (MediaQuery.of(context).size.height * 0.355), //300
            ),
            top: (MediaQuery.of(context).size.height * 0.142), //120
            left: (MediaQuery.of(context).size.width * 0.461), //180
          ),
          Positioned(
            child: Text(
              "Verify your phone number",
              style: TextStyle(
                fontSize: (MediaQuery.of(context).size.width * 0.064),
                fontWeight: FontWeight.bold,
              ),
            ),
            top: (MediaQuery.of(context).size.height * 0.177), //150
            left: (MediaQuery.of(context).size.width * 0.128), //50
          ),
          Positioned(
            child: Text(
              "Confirm the country code and Enter \n          Your Phone number",
              style: TextStyle(
                  fontSize: (MediaQuery.of(context).size.width * 0.037), //12,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic),
            ),
            top: (MediaQuery.of(context).size.height * 0.236), //200,
            left: (MediaQuery.of(context).size.width * 0.200), //110,
          ),
          Positioned(
            child: Container(
              height: (MediaQuery.of(context).size.height * 0.060),//50,
              width: (MediaQuery.of(context).size.width * 0.769), //300,
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
            top: (MediaQuery.of(context).size.height * 0.331), //280,
            left: (MediaQuery.of(context).size.width * 0.128), //50,
          ),
          Positioned(
            child: Container(
              height: (MediaQuery.of(context).size.height * 0.060),//50,
              width: (MediaQuery.of(context).size.width * 0.769), //300,
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
            top: (MediaQuery.of(context).size.height * 0.414), //350,
            left: (MediaQuery.of(context).size.width * 0.128), //50,
          ),
          Positioned(
            child: Container(
              height: (MediaQuery.of(context).size.height * 0.054),//46,
              width: (MediaQuery.of(context).size.width * 0.453), //174,
              child: Align(child: Text('Next')),
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
            top: (MediaQuery.of(context).size.height * 0.533),//450,
            left: (MediaQuery.of(context).size.width * 0.282),//110,
          ),
        ],
      ),
    );
  }
}
