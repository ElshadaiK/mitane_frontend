import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/drawer.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/appBar.dart';
import 'package:mitane_frontend/presentation/pages/priceHub/screens/price_hub_data_encoder_screen.dart';
import 'package:mitane_frontend/presentation/pages/suggestions/suggestions.dart';
// import 'package:mitane_frontend/trending/screens/trending_screen.dart';
class HomeDE extends StatefulWidget {
  @override
  _Dashboard createState() {
    return _Dashboard();
  }
}

class _Dashboard extends State<HomeDE> {
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
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
                        Navigator.of(context).pushNamed('/product');
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
                        Navigator.of(context).pushNamed('/inputs');
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
                        Navigator.of(context).pushNamed('/machinery');
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
                                  "Machinery",
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

      

    );
  }
}
