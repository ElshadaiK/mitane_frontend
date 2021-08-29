import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';




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
            border: Border(left: BorderSide(color: Colors.primaries[Random().nextInt(Colors.primaries.length)], width: 5))),
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
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "RobotMono"),
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
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "RobotMono"),
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