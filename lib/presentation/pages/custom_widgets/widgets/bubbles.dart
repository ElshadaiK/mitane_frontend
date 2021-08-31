import 'package:flutter/material.dart';

class Bubble extends StatelessWidget {
  final double height;
  final double width;
  const Bubble({Key? key, this.height = 0.0 , this.width = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.all(100.0),
      decoration: BoxDecoration(color: Color(0x709E2F).withOpacity(0.32), shape: BoxShape.circle),
    );
  }
}
