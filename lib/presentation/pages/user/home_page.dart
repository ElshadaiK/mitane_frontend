import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mitane_frontend/presentation/pages/custome_widgets/drawer.dart';
import 'package:mitane_frontend/presentation/pages/custome_widgets/widgets/bubbles.dart';
import 'package:mitane_frontend/presentation/pages/common/with_search_bar.dart';

class Home extends StatefulWidget {
  @override
  _Dashboard createState() {
    return _Dashboard();
  }
}

class _Dashboard extends State {
  @override
  Widget build(BuildContext context) {
    return FarmerWithSearchBar(
      floaters: [],
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: SizedBox(
                        width: 300.0,
                        height: 100.0,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Container(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, top: 30),
                                    child: Icon(
                                      Icons.thermostat,
                                      color: Colors.grey[800],
                                      size: 40.0,
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                height: 100,
                                width: 10,
                                child: VerticalDivider(
                                  color: Colors.grey,
                                  thickness: 0.5,
                                  indent: 20,
                                  endIndent: 20,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 25.0, top: 30),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.cloud,
                                          color: Colors.green[200],
                                          size: 30,
                                        ),
                                        Text('25, June'),
                                      ],
                                    ),
                                    Column(
                                      children: [Text('Rain'), Text('25c')],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )),
                        )),
                  )
                ]),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
                child: Wrap(spacing: 20, runSpacing: 20.0, children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 132.0,
                    height: 132.0,
                    child: Card(
                      color: Colors.green[300],
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      child: GestureDetector(
                        onTap: () {
                          print("tapped");
                        },
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 7.0, top: 35),
                          child: Column(
                            children: <Widget>[
                              FaIcon(
                                FontAwesomeIcons.home,
                                color: Colors.white,
                                size: 30,
                              ),
                              Text(
                                "Agricultural inputs",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.0),
                              ),
                            ],
                          ),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 132.0,
                    height: 132.0,
                    child: Card(
                      color: Colors.green[300],
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      child: GestureDetector(
                        onTap: () {
                          print("tapped");
                        },
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 7.0, top: 35),
                          child: Column(
                            children: <Widget>[
                              FaIcon(
                                FontAwesomeIcons.pagelines,
                                color: Colors.white,
                                size: 30,
                              ),
                              Text(
                                "Agricultural Products",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.0),
                              ),
                            ],
                          ),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 132.0,
                    height: 132.0,
                    child: Card(
                        color: Colors.green[300],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: GestureDetector(
                          onTap: () {
                            print("tapped");
                          },
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 7.0, top: 35),
                            child: Column(
                              children: <Widget>[
                                FaIcon(
                                  FontAwesomeIcons.fan,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                Text(
                                  "Machinery",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0),
                                ),
                              ],
                            ),
                          )),
                        )),
                  ),
                ],
              )
            ])),
          ),
        ],
      )),
      // drawer: NavDrawer(), floaters: [],
    );
  }
}
