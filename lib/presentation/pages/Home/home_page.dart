import 'package:flutter/material.dart';
class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightGreen[100],
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    Icons.menu,
                    color: Colors.green[600],
                    size: 52.0,
                  ),
                  Icon(
                    Icons.person,
                    color: Colors.grey[800],
                    size: 40.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(left: 70.0),
                                  child: Icon(
                                    Icons.thermostat_outlined,
                                    color: Colors.grey,
                                    size: 60.0,
                                    semanticLabel:
                                        'Text to announce in accessibility modes',
                                  ))
                            ],
                          ),
                          Container(
                            height: 100,
                            width: 160,
                            child: VerticalDivider(
                              color: Colors.grey,
                              thickness: 0.5,
                              indent: 20,
                              endIndent: 20,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 80.0),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Icon(
                                      Icons.cloud_outlined,
                                      color: Colors.green[100],
                                      size: 40.0,
                                      semanticLabel:
                                          'Text to announce in accessibility modes',
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
                      width: 160.0,
                      height: 160.0,
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
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.house_outlined,
                                  color: Colors.green[100],
                                  size: 40.0,
                                  semanticLabel:
                                      'Text to announce in accessibility modes',
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "Agricultural inputs",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 160.0,
                      height: 160.0,
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
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.flaky_outlined,
                                  color: Colors.green[100],
                                  size: 40.0,
                                  semanticLabel:
                                      'Text to announce in accessibility modes',
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "Agricultural Products",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                                SizedBox(
                                  height: 5.0,
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
                      width: 160.0,
                      height: 160.0,
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
                              padding: const EdgeInsets.all(30.0),
                              child: Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.military_tech_outlined,
                                    color: Colors.green[100],
                                    size: 40.0,
                                    semanticLabel:
                                        'Text to announce in accessibility modes',
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "Machinery",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                  SizedBox(
                                    height: 5.0,
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
        )));
  }
}
