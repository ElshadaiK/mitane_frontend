import 'package:flutter/material.dart';
import 'package:mitane_frontend/presentation/pages/suggestions/suggestions_result.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class VerticalCardPagerDemo extends StatefulWidget {
  @override
  _VerticalCardPagerDemoState createState() => _VerticalCardPagerDemoState();
}

class _VerticalCardPagerDemoState extends State<VerticalCardPagerDemo> {
  final List<String> titles = [
    "Price",
    "Weather",
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> images = [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
              image: AssetImage('assets/priceCoin.jpg'), fit: BoxFit.cover),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
              image: AssetImage('assets/irrigation.jpg'), fit: BoxFit.cover),
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
      onSelectedItem: (index) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultDisplay(),
            ),
          );
      },
    );
  }
}
