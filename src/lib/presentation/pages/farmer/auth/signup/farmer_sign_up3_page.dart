import 'package:flutter/material.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/widgets/bubbles.dart';
import 'package:mitane_frontend/presentation/pages/farmer/app_widget.dart';

class FarmerSignUp3 extends StatelessWidget {
  const FarmerSignUp3({Key? key}) : super(key: key);

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
              "Last Step!",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            top: 200,
            left: 125,
          ),
          Positioned(
            child: Text(
              "Set your name and password",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic),
            ),
            top: 250,
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
                      hintText: 'Name'),
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
                      hintText: 'Password'),
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
                  MaterialPageRoute(builder: (context) => AppWidget()),
                );
              },
              child: Container(
                height: 46,
                width: 174,
                child: Align(
                  child: Text(
                    "That's it",
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
