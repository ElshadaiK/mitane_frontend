import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class CustomeTile extends StatelessWidget {
  final String product;
  final String quantity;
  final String price;
  final String category;

  CustomeTile(
      {Key? key,
      required this.product,
      required this.quantity,
      required this.price,
      required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(10))),
      child: Container(
        height: 90,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border(left: BorderSide(width: 5, color: Colors.green))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$product",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: "RobotMono"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "$category",
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        FaIcon(FontAwesomeIcons.dollarSign),
                        Text(
                          '$price',
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                    Text('$quantity')
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
