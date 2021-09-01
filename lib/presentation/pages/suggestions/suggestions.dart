import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/navbar.dart';
import 'package:mitane_frontend/presentation/pages/suggestions/vertical_tiles.dart';

class Suggestions extends StatelessWidget {
  const Suggestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: (MediaQuery.of(context).size.width),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              NavBar(),
              SizedBox(
                height: 15,
              ),
              Text(
                "Your Farm tells a story",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0x8CC63E).withOpacity(1),
                ),
              ),
              Container(
                child: Expanded(
                  child: VerticalCardPagerDemo(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
