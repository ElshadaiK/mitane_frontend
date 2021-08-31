import 'package:flutter/material.dart';
import 'package:mitane_frontend/presentation/pages/signup/widgets/bubbles.dart';
import 'package:mitane_frontend/presentation/pages/signup/farmer_sign_up_page.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x709E2F).withOpacity(0.2),
      body: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => FarmerSignUp()));
          },
          child: Stack(
            children: [
          Positioned(
            child: Bubble(
              height: (MediaQuery.of(context).size.height * 0.142), //120,
              width: (MediaQuery.of(context).size.width * 0.307), //120,
            ),
            top: -(MediaQuery.of(context).size.height * 0.177),//150,
            left: (MediaQuery.of(context).size.width * 0.307),//120,
          ),
          Positioned(
            child: Bubble(
              height: (MediaQuery.of(context).size.height * 0.059),//50,
              width: (MediaQuery.of(context).size.width * 0.128),//50,
            ),
            top: (MediaQuery.of(context).size.height * 0.059),//50,
            left: -(MediaQuery.of(context).size.width * 0.205),//80,
          ),
          Positioned(
            child: Bubble(
              height: (MediaQuery.of(context).size.height * 0.296),//250,
              width: (MediaQuery.of(context).size.width * 0.641),//250,
            ),
            top: (MediaQuery.of(context).size.height * 0.592),//500,
            left: (MediaQuery.of(context).size.width * 0.307),//120,
          ),
          Positioned(
            child: Image.asset(
              'assets/METANE.png',
              height: (MediaQuery.of(context).size.height * 0.177),//150,
              width: (MediaQuery.of(context).size.width * 0.769),//300,
            ),
            top: (MediaQuery.of(context).size.height * 0.331),//280,
            left: (MediaQuery.of(context).size.width * 0.153),//60,
          ),
        ],
          ),
      )
    );
  }
}
