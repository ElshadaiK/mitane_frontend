import 'package:flutter/material.dart';
import 'package:mitane_frontend/presentation/pages/custome_widgets/widgets/bubbles.dart';
import 'package:mitane_frontend/presentation/pages/common/welcome.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0x709E2F).withOpacity(0.2),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => WelcomePage()));
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
        ),
      ),
    );
  }
}
