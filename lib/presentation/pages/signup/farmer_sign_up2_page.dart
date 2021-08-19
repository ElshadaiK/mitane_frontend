import 'package:flutter/material.dart';
import 'package:mitane_frontend/presentation/pages/signup/widgets/bubbles.dart';
import 'package:mitane_frontend/presentation/pages/signup/widgets/hexagon_container.dart';

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
              "Last Step!",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            top: 150,
            left: 125,
          ),
          Positioned(
            child: Text(
              "Set your name and profile",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic),
            ),
            top: 200,
            left: 110,
          ),
          Positioned(
            child: Row(
              children: [
                Text(
                  "Select ",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                      fontStyle: FontStyle.normal),
                ),
                Text(
                  "Profile image",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xB7F1).withOpacity(1),
                      fontWeight: FontWeight.w200,
                      fontStyle: FontStyle.normal),
                ),
              ],
            ),
            top: 270,
            left: 130,
          ),
          Positioned(
            child: Stack(
              children: [
                HexContainer(
                  height: 150,
                  width: 150,
                ),
                Positioned(child: Icon(Icons.person))
              ]
            ),
            top: 320,
            left: 115,
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
            top: 510,
            left: 50,
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
            top: 570,
            left: 50,
          ),
          Positioned(
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
            top: 680,
            left: 180,
          ),
        ],
      ),
    );
  }
}
