import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/drawer.dart';
import 'package:mitane_frontend/presentation/pages/suggestions/vertical_tiles.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/appBar.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/widgets/bubbles.dart';

class Trending extends StatelessWidget {
  static const String routeName = '/trending';
  const Trending({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(
          "Trending Products",
          style: TextStyle(color: Colors.black),
        ),
          ),
      drawer: NavDrawer(),
      body: Stack(children: [
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
                height: 250.0,
                width: 250,
              ),
              top: 130,
              left: 180,
            ),
            Positioned(
              child: Container(
                width: 400,
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/trending.png"))),
              ),
              bottom: -15,
              left: -20,
            ),
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: VerticalCardPagerDemo(),
              ),
            ),
          ]),

    );
  }
}
