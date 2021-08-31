import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mitane_frontend/models/store-model.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/add_icon_button.dart';

class StoreDisplay extends StatefulWidget {
  static const String routeName = '/store';
  final List<Store> items;

  const StoreDisplay(List<Store> list, {required this.items});

  @override
  _StoreDisplayState createState() => _StoreDisplayState();
}

class _StoreDisplayState extends State<StoreDisplay> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color(0xFF8CC63E),
                borderRadius: BorderRadius.circular(10)),
            padding:
                const EdgeInsets.only(top: 30, bottom: 30, left: 10, right: 10),
            margin: EdgeInsets.only(top: 30, bottom: 20, left: 30, right: 30),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Decide your share of the market!!",
                  style: TextStyle(fontSize: 20, fontFamily: "RobotMono"),
                ),
                Text(
                  "Date will be displayed here",
                  style: TextStyle(fontSize: 19, fontFamily: "RobotMono"),
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
                    margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: StoreItemCard(
                        productName: curPrice.productName,
                        quantity: curPrice.quantity,
                        price: curPrice.price),
                  );
                }),
          ),
          AddIconButton(StoreDisplay.routeName)
        ],
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
        padding: EdgeInsets.only(left: 20, right: 50),
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
