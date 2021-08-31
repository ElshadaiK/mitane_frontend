import 'package:flutter/material.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/drawer.dart';
import 'package:mitane_frontend/presentation/pages/farmer/profile.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(100);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Builder(
                  builder: (context) => IconButton(
                    icon: ImageIcon(
                      AssetImage("assets/images/humburger.png"),
                      color: Colors.green[600],
                    ),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
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
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FarmerProfilePage()));
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
          )),
    );
  }
}
