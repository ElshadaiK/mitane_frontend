import 'package:flutter/material.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/navbar.dart';

class FarmerWithSearchBar extends StatelessWidget {
  FarmerWithSearchBar({Key? key, required this.child, required this.floaters})
      : super(key: key);
  final Widget child;
  final List<Positioned> floaters;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
          child: Stack(
        children: [
          if (floaters != null) ...floaters,
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 10),
                      child: NavBar()),
                  Expanded(child: child),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
