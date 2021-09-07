import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mitane_frontend/models/price-model.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/appBar.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/bottom_nav.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/drawer.dart';
import 'package:mitane_frontend/presentation/pages/priceHub/screens/price_hub_add_screen.dart';
import 'package:mitane_frontend/presentation/pages/priceHub/screens/price_hub_edit.dart';
class PriceHubDisplay extends StatefulWidget {
  static const String routeName = '/priceHub';
  final List<Price> items;

  const PriceHubDisplay({required this.items});

  get curPrice => null;

  @override
  _PriceHubState createState() => _PriceHubState ();
}

class _PriceHubState  extends State<PriceHubDisplay> {
  @override
  void initState() {
    super.initState();
  }

  Widget slideRightBackground() {
  return Container(
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 40,
            ),
            Icon(
              Icons.align_horizontal_right_rounded,
              color: Colors.green,
              size: 30,
            ),
            Icon(
              Icons.edit,
              color: Colors.green,
              size: 30,
            ),            
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }

  Widget slideLeftBackground() {
    return Container(
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.red,
              size: 30,
            ),
            Icon(
              Icons.align_horizontal_left_rounded,
              color: Colors.red,
              size: 30,
            ),
            SizedBox(
              width: 40,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      drawer: NavDrawer(),
      resizeToAvoidBottomInset: false,  
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Container(
            decoration: BoxDecoration(
                color: Color(0xFF8CC63E),
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.only(top: 10, bottom: 10, left: 2, right: 2),
            margin: EdgeInsets.only(top: 10, bottom: 0, left: 10, right: 10),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Decide your share of the market!",
                  style: TextStyle(fontSize: 20, fontFamily: "RobotMono", color: Colors.white),                  
                ),
                Text(
                  "Date will be displayed here",
                  style: TextStyle(fontSize: 10, fontFamily: "RobotMono", color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: widget.items.length,
                itemBuilder: (BuildContext context, int index) {
                  Price curPrice = widget.items[index];
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),                    
                    child: Dismissible(                    
                        child: PriceItemCard(
                            productName: curPrice.productName,
                            unit: curPrice.unit,
                            todayPrice: curPrice.todayPrice,
                            dayBeforePrice: curPrice.dayBeforePrice

                        ),
                        background: slideRightBackground(),
                        secondaryBackground: slideLeftBackground(),
                        key: ValueKey<Price>(widget.items[index]),
                        confirmDismiss: (direction) async {
                        if (direction == DismissDirection.endToStart) {
                          final bool res = await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Text(
                                      "Are you sure you want to delete ${widget.items[index].productName}?"),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      onPressed: () {                                        
                                        Navigator.pop(context, false);
                                      },
                                    ),
                                    TextButton(
                                      child: Text(
                                        "Delete",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          widget.items.removeAt(index);
                                        });
                                        Navigator.pop(context, true);
                                      },
                                    ),
                                  ],
                                );
                              });
                          return res;
                        } else if (direction == DismissDirection.startToEnd){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PriceHubEdit()),
                            );
                          }
                        },
                      ),
                  );
                   
                }),
          ),         
        ],
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PriceHubAdd()),
          );
        },        
        child: const Icon(Icons.add, color: Colors.green,),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class PriceItemCard extends StatelessWidget {
  final String productName;
  final int todayPrice;
  final int dayBeforePrice;
  final String unit;
  const PriceItemCard(
      {Key? key,
      required this.productName,
      required this.todayPrice,
      required this.dayBeforePrice,
      required this.unit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
            border: Border(
                left: BorderSide(
                    color: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                    width: 5))),
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$productName",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: "RobotMono"),
                ),
                 Text(
                  "Unit: $unit kg" ,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: "RobotMono"),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.projectDiagram,
                        size: 16,
                        color: Colors.red,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "$dayBeforePrice Birr",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FaIcon(
                        FontAwesomeIcons.projectDiagram,
                        size: 16,
                        color: Colors.green,
                      ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "$todayPrice Birr",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
