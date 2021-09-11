import 'package:flutter/material.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/widgets/bubbles.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/drawer.dart';
class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
         appBar: AppBar(
          title: Text(
            "Details",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        drawer: NavDrawer(),
        backgroundColor: Colors.white,
        body: getBody(),
      ),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 200,
            // height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              color: Colors.green[200],
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.menu)),
                    Row(
                      children: <Widget>[
                        Icon(Icons.home),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(Icons.supervised_user_circle),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 100),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    child: Container(
                      width: 150,
                      height: 7,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Product Information",
                    style: TextStyle(fontSize: 20, height: 1.5),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(children: <Widget>[
                    Column(
                      children: [
                        Row(children: [
                          Container(
                            child: Text(
                              "Product Name:",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Teff",
                              ),
                              SizedBox(
                                width: 3,
                              ),
                            ],
                          ),
                        ])
                      ],
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Column(
                      children: [
                        Row(children: [
                          Container(
                            child: Text(
                              "Category:",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Grain",
                              ),
                              SizedBox(
                                width: 3,
                              ),
                            ],
                          ),
                        ])
                      ],
                    )
                  ]),
                  SizedBox(
                    height: 20,
                  ),
                  Row(children: <Widget>[
                    Column(
                      children: [
                        Row(children: [
                          Container(
                            child: Text(
                              "Price:",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "150 Birr/Kg",
                              ),
                              SizedBox(
                                width: 3,
                              ),
                            ],
                          ),
                        ])
                      ],
                    ),
                    SizedBox(
                      width: 50,
                    ),
                  ]),
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    "Owner's Information",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(children: [
                        Row(children: <Widget>[
                          Column(
                            children: [
                              Row(children: [
                                Container(
                                  child: Text(
                                    "Farmer's Name:",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Abebe",
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                  ],
                                ),
                              ])
                            ],
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Column(
                            children: [
                              Row(children: [
                                Container(
                                  child: Text(
                                    "Phone Number:",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "+2519888888",
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                  ],
                                ),
                              ])
                            ],
                          )
                        ]),
                        SizedBox(
                          height: 20,
                        ),
                        Row(children: <Widget>[
                          Column(
                            children: [
                              Row(children: [
                                Container(
                                  child: Text(
                                    "Location:",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Harar",
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                  ],
                                ),
                              ])
                            ],
                          ),
                        ]),
                        SizedBox(
                          height: 20,
                        ),
                      ]))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

