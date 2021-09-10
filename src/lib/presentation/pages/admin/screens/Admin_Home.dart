import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mitane_frontend/presentation/pages/agri_inputs/screens/IngredientAdmin_Lists.dart';
import 'package:mitane_frontend/presentation/pages/agri_product/screens/ProductAdmin_Lists.dart';
import 'package:mitane_frontend/presentation/pages/machinery/screens/MachineryAdmin_Lists.dart';
import 'package:mitane_frontend/presentation/pages/user/screens/UserAdmin_Lists.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/drawer.dart';
import 'package:mitane_frontend/presentation/pages/farmer/home_page.dart';
import 'package:mitane_frontend/presentation/pages/priceHub/screens/price_hub_screen.dart';
import 'package:mitane_frontend/presentation/pages/suggestions/suggestions.dart';
import 'package:mitane_frontend/presentation/pages/trending/trending_screen.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  static String routeName = '/admin';

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  List<Widget> pages = [Home(), PriceHub()];
  int selectedPage = 0;
  @override
  void initState() {
    super.initState();
    selectedPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: NavDrawer(),
      body: Container(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Card(
                color: Colors.white30,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.thermostat,
                          color: Colors.grey[800],
                          size: 50.0,
                        ),
                        Container(
                          child: VerticalDivider(
                            color: Colors.black,
                            thickness: 1,
                            indent: 20,
                            endIndent: 20,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.cloud,
                                      color: Colors.green[100],
                                      size: 30,
                                    ),
                                    Column(
                                      children: [
                                        Text('Cloud',
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold)),
                                        Text('25' + " \u2103")
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  '25, June',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
            Center(
                child: Wrap(spacing: 20, runSpacing: 20.0, children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 150.0,
                    height: 160.0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminProducts(),
                        ));
                      },
                      child: Card(
                          color: Color(0xDD8CC63E),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                FaIcon(
                                  FontAwesomeIcons.spa,
                                  color: Colors.white,
                                  size: 80,
                                ),
                                Text(
                                  "Agricultural Products",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 150.0,
                    height: 160.0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminIngredients(),
                        ));
                      },
                      child: Card(
                          color: Color(0xDD8CC63E),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                FaIcon(
                                  FontAwesomeIcons.handsHelping,
                                  color: Colors.white,
                                  size: 80,
                                ),
                                Text(
                                  "Agricultural Inputs",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 150.0,
                    height: 160.0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminMachineries(),
                        ));
                      },
                      child: Card(
                          color: Color(0xDD8CC63E),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                FaIcon(
                                  FontAwesomeIcons.cogs,
                                  color: Colors.white,
                                  size: 80,
                                ),
                                Text(
                                  "Machineries",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 150.0,
                    height: 160.0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminUsers(),
                        ));
                      },
                      child: Card(
                          color: Color(0xDD8CC63E),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                FaIcon(
                                  FontAwesomeIcons.userFriends,
                                  color: Colors.white,
                                  size: 80,
                                ),
                                Text(
                                  "Users",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                ],
              )
            ])),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) async {
          if (index == 2) {
            await showMenu(
              context: context,
              position: RelativeRect.fromLTRB(1000.0, 1000.0, 0.0, 0.0),
              items: [
                PopupMenuItem(
                  child: GestureDetector(
                    child: Text("Suggestions"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Suggestions(),
                      ));
                    },
                  ),
                ),
                PopupMenuItem(
                  child: GestureDetector(
                    child: Text("Trending"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TrendingScreen(),
                      ));
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
              icon: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                   Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminHome(),
                        ));
                },
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.bar_chart),
                onPressed: () {
                   Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PriceHub(),
                        ));
                },
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
