import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class VerticalCardPagerDemo extends StatefulWidget {
  @override
  _VerticalCardPagerDemoState createState() => _VerticalCardPagerDemoState();
}

class _VerticalCardPagerDemoState extends State<VerticalCardPagerDemo> {
  final List<String> titles = [
    "Irrigation",
    "Animal Husbandry",
    "Harvest",
    "Apiculture",
    "Crop Managment",
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> images = [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
              image: AssetImage('assets/irrigation.jpg'), fit: BoxFit.cover),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
              image: AssetImage('assets/cow1.jpg'), fit: BoxFit.cover),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
              image: AssetImage('assets/harvest.jpg'), fit: BoxFit.cover),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
              image: AssetImage('assets/bee.jpg'), fit: BoxFit.cover),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
              image: AssetImage('assets/track.jpg'), fit: BoxFit.cover),
        ),
      ),
    ];
    return VerticalCardPager(
      textStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 14,
        shadows: [
          Shadow(
              color: Colors.white,
              offset: Offset(1.0, 1.0),
              blurRadius: 2),
          Shadow(
              color: Colors.white,
              offset: Offset(-1.0, 1.0),
              blurRadius: 2),
        ]
      ),
      titles: titles,
      images: images,
      onPageChanged: (page) {},
      align: ALIGN.CENTER,
      onSelectedItem: (index) {},
    );
  }
}
