import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.home,
                color: Color(0xFF707070),),
              Text(
                "Home",
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.bar_chart,
                color: Color(0xFF707070),),
              Text(
                "Price Hub",
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.settings,
                color: Color(0xFF707070),),
              Text(
                "Service",
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          )

        ],
      ),
    );
  }
}