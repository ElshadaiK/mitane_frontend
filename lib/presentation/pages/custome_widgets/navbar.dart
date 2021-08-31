import 'package:flutter/material.dart';
import 'package:mitane_frontend/services/locator.dart';
import 'package:mitane_frontend/services/navigator.dart';
import 'package:mitane_frontend/util/const.dart';
import 'package:mitane_frontend/presentation/pages/farmer/profile.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () =>
              locator<NavigationService>().drawerController.toggle!(),
          icon: ImageIcon(
            AssetImage("assets/images/humburger.png"),
            color: Colors.green[600],
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: const Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xffe6ecf4),
                  offset: Offset(0, 2),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: 'Search Products',
                        contentPadding: EdgeInsets.zero,
                        isCollapsed: false,
                        labelStyle: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 13,
                          color: const Color(0x66000000),
                          letterSpacing: -0.0010399999767541886,
                          fontWeight: FontWeight.w300,
                          height: 1.3846153846153846,
                        ),
                        isDense: true,
                        border: InputBorder.none),
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 13,
                      color: const Color(0x66000000),
                      letterSpacing: -0.001,
                      fontWeight: FontWeight.w300,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SmileFarmerProfilePage()));
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/Group 2474.png"))),
          ),
        ),
      ],
    );
  }
}
