import 'package:flutter/material.dart';

//this is a class used to apply gradient mask over elemenst such as ICONS
//to see use go to farmer_sign_up2 page applied on the profile icon

class RadiantGradientMask extends StatelessWidget {
  RadiantGradientMask({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0x8CC63E).withOpacity(1),
          Color(0x709E2F).withOpacity(1),
        ],
      ).createShader(bounds),
      child: child,
    );
  }
}
