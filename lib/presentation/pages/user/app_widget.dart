import 'package:flutter/material.dart';

import 'package:mitane_frontend/machinery/screens/machinery_screen.dart';
import 'package:mitane_frontend/models/store-model.dart';

import 'package:mitane_frontend/presentation/pages/farmer/home_page.dart';
import 'package:mitane_frontend/presentation/pages/farmer/store_screen.dart';
import 'package:mitane_frontend/presentation/pages/suggestions/suggestions.dart';
import 'package:mitane_frontend/priceHub/priceHub.dart';
import 'package:mitane_frontend/trending/screens/trending_screen.dart';

class AppWidget2 extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget2> {
  List<Widget> pages = [
    Home(),
    PriceHub(),
    StoreDisplay(
      items: [
        new Store("Banana", 80, 25),
        new Store("Banana", 80, 25),
        new Store("Banana", 80, 25),
      ],
    ),
  ];
  int selectedPage = 0;
  @override
  void initState() {
    super.initState();
    selectedPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) async {
          if (index == 2) {
            await showMenu(
              context: context,
              position: RelativeRect.fromLTRB(1000.0, 1000.0, 0.0, 0.0),
              items: [
                PopupMenuItem(
                  child: GestureDetector(
                    child: Text("Trending"),
                    onTap: () {
                      setState(() {
                        pages[2] = TrendingScreen();
                        selectedPage = 2;
                      });
                    },
                  ),
                ),
              ],
              elevation: 8.0,
            );
          } else {
            setState(() {
              selectedPage = index;
            });
          }
        },
        currentIndex: selectedPage,
        selectedItemColor: Colors.green,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.bar_chart,
              ),
              label: "Price Hub"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: "Service"),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
