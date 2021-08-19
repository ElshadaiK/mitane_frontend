import 'package:flutter/material.dart';
import 'dart:math' as math;

class HexContainer extends StatelessWidget {
  final double height;
  final double width;
  const HexContainer({Key? key, this.height = 0.0, this.width = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: math.pi /4,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Color(0x709E2F).withOpacity(0.13),
          borderRadius: BorderRadius.circular(25)

        ),
      ),
    );
  }
}


