import 'package:flutter/material.dart';
import 'package:mitane_frontend/presentation/pages/custome_widgets/gradient_mask.dart';
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
              height: (MediaQuery.of(context).size.height * 0.355),
              width: (MediaQuery.of(context).size.width * 0.769),
            ),
            top: -(MediaQuery.of(context).size.height * 0.258),
            left: (MediaQuery.of(context).size.width * 0.243),
          ),
          Positioned(
            child: Bubble(
              height: (MediaQuery.of(context).size.height * 0.178),
              width: (MediaQuery.of(context).size.width * 0.384),
            ),
            top: (MediaQuery.of(context).size.height * 0.473),
            left: -(MediaQuery.of(context).size.width * 0.423),
          ),
          Positioned(
            child: Text(
              "Last Step!",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            top: (MediaQuery.of(context).size.height * 0.177),
            left: (MediaQuery.of(context).size.width * 0.32),
          ),
          Positioned(
            child: Text(
              "Set your name and profile",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic),
            ),
            top: (MediaQuery.of(context).size.height * 0.236),
            left: (MediaQuery.of(context).size.width * 0.288),
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
            top: (MediaQuery.of(context).size.height * 0.319),
            left: (MediaQuery.of(context).size.width * 0.333),
          ),

          //this the rombus container for the profile picture

          Positioned(
            child: Stack(children: [
              HexContainer(
                height: (MediaQuery.of(context).size.height * 0.177),
                width: (MediaQuery.of(context).size.height * 0.177),
              ),
              Positioned(
                child: RadiantGradientMask(
                  child: Icon(
                    Icons.person,
                    size: 100,
                    color: Colors.white,
                    
                  ),
                ),
                top: 10,
                left: 25,
              )
            ]),
            top: (MediaQuery.of(context).size.height * 0.379),
            left: (MediaQuery.of(context).size.width * 0.33),
          ),


          //this is the text field
          //for future replace with a form field that will containe both Text field for access to additional form methods 
          //TODO
          Positioned(
            child: Container(
              width: (MediaQuery.of(context).size.width * 0.769),
              height: (MediaQuery.of(context).size.height * 0.063),
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(5),
                child: Center(
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
            ),
            top: (MediaQuery.of(context).size.height * 0.604),
            left: (MediaQuery.of(context).size.width * 0.128),
          ),
          Positioned(
            child: Container(
              width: (MediaQuery.of(context).size.width * 0.769),
              height: (MediaQuery.of(context).size.height * 0.063),
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
            top: (MediaQuery.of(context).size.height * 0.675),
            left: (MediaQuery.of(context).size.width * 0.128),
          ),
          Positioned(
            child: Container(
              height: (MediaQuery.of(context).size.height * 0.054),
              width: (MediaQuery.of(context).size.width * 0.328),
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
            top: (MediaQuery.of(context).size.height * 0.805),
            left: (MediaQuery.of(context).size.width * 0.461),
          ),
        ],
      ),
    );
  }
}
