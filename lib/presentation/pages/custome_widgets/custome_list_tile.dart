import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class CustomeTile extends StatelessWidget{
  final String product;
  final String quantity;
  final String price;
  final Color borderColor;

  CustomeTile({Key? key,required this.product, required this.quantity, required this.price, required this.borderColor }):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight:Radius.circular(20),bottomRight: Radius.circular(20))
        ),

        child: Container(
          height: 90,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border(left: BorderSide(width: 5,color: borderColor))
          ),
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
                          fontSize: 25
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                            "Vegitable",
                            textAlign: TextAlign.start,
                        ),
                    ),
                    
                  ],
                ),
              ),
              Text(
                "Quantity $quantity"
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 25),
                child: Row(
                  children: [
                    FaIcon(FontAwesomeIcons.dollarSign),
                    Text(
                      '$price',
                      style: TextStyle(
                        fontSize: 25
                      ),
                    ),
                  ],
                )
              )
            ],
          ),
        ),
      );
  }
}