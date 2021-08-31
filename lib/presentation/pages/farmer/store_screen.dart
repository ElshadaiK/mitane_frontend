import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mitane_frontend/models/store-model.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/drawer.dart';
import 'package:mitane_frontend/presentation/pages/farmer/store_add_screen.dart';
import 'package:mitane_frontend/presentation/pages/farmer/store_edit_screen.dart';

class StoreDisplay extends StatefulWidget {
  static const String routeName = '/store';
  final List<Store> items;

  const StoreDisplay({required this.items});

  get curPrice => null;

  @override
  _StoreDisplayState createState() => _StoreDisplayState();
}

class _StoreDisplayState extends State<StoreDisplay> {
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
      appBar: AppBar(
        title: Text(
          "My Store",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
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
            padding: const EdgeInsets.only(top: 30, bottom: 30, left: 10, right: 10),
            margin: EdgeInsets.only(top: 30, bottom: 0, left: 30, right: 30),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Decide your share of the market!!",
                  style: TextStyle(fontSize: 20, fontFamily: "RobotMono", color: Colors.white),                  
                ),
                Text(
                  "Date will be displayed here",
                  style: TextStyle(fontSize: 19, fontFamily: "RobotMono", color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: widget.items.length,
                itemBuilder: (BuildContext context, int index) {
                  Store curPrice = widget.items[index];
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),                    
                    child: Dismissible(                    
                        child: StoreItemCard(
                            productName: curPrice.productName,
                            quantity: curPrice.quantity,
                            price: curPrice.price
                        ),
                        background: slideRightBackground(),
                        secondaryBackground: slideLeftBackground(),
                        key: ValueKey<Store>(widget.items[index]),
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
                              MaterialPageRoute(builder: (context) => StoreEdit()),
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
            MaterialPageRoute(builder: (context) => StoreAdd()),
          );
        },        
        child: const Icon(Icons.add, color: Colors.green,),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class StoreItemCard extends StatelessWidget {
  final String productName;
  final int price;
  final int quantity;
  const StoreItemCard(
      {Key? key,
      required this.productName,
      required this.price,
      required this.quantity})
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
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Quantity:",
                        style: TextStyle(fontSize: 16, fontFamily: "RobotMono"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "$quantity kg",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Price:",
                      style: TextStyle(fontSize: 16, fontFamily: "RobotMono"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "$price birr",
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
