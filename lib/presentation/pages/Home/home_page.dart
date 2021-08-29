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
                  