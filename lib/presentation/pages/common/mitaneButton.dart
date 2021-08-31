import 'package:flutter/material.dart';
import 'package:mitane_frontend/util/const.dart';

class MitaneButton extends StatelessWidget {
  final Function onPressed;
  final String title;

  final double paddingHorizontal;

  const MitaneButton(
      {Key? key,
      required this.onPressed,
      required this.title,
      this.paddingHorizontal = 60.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      padding: EdgeInsets.zero,
      onPressed: () {
        this.onPressed();
      },
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Constants.primary,
            gradient: LinearGradient(
              begin: Alignment(0.0, -1.0),
              end: Alignment(0.0, 1.0),
              colors: [ Color(0x8CC63E).withOpacity(1),
                      Color(0x709E2F).withOpacity(1)],
              stops: [0.0, 1.0],
            ),
            boxShadow: [
              BoxShadow(
                  color: Color(0xff0399DE).withOpacity(.32),
                  blurRadius: 10,
                  offset: Offset(0, 8))
            ]),
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 18,
            color: const Color(0xffffffff),
            fontWeight: FontWeight.w300,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
