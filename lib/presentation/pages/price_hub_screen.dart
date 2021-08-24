import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mitane_frontend/models/price-model.dart';

class PriceHub extends StatefulWidget {
  final List<Price> prices;
  static const List<String> _category = [
    "Fruits",
    "Vegitable",
    "Dairy Product",
    "Ceral",
    "Fruit",
    "Vegiable",
    "Daiy Product",
    "Ceal"
  ];

  List<String> getCategory() => _category;

  const PriceHub({required this.prices});

  @override
  _PriceHubState createState() => _PriceHubState();
}

class _PriceHubState extends State<PriceHub> {
  String? selectedCategory = "";

  String? get() => selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.getCategory()[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 8, bottom: 30),
            margin: EdgeInsets.only(top: 30, bottom: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Category",
                  style: TextStyle(fontSize: 25, fontFamily: "RobotMono"),
                ),
                Container(
                  width: (MediaQuery.of(context).size.width * 40) / 100,
                  padding: EdgeInsets.only(left: 15.0),
                  decoration: BoxDecoration(
                      color: Color(0xFF8CC63E),
                      borderRadius: BorderRadius.circular(20)),
                  child: DropdownButton(
                    menuMaxHeight: 5 * 48,
                    value: selectedCategory,
                    dropdownColor: Colors.white,
                    underline: Container(color: Colors.transparent),
                    items: widget
                        .getCategory()
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        selectedCategory = value;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: widget.prices.length,
                itemBuilder: (BuildContext context, int index) {
                  Price curPrice = widget.prices[index];
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: PriceCard(
                        product: curPrice.productName,
                        unit: curPrice.unit,
                        todayPrice: curPrice.todayPrice,
                        prevDayPrice: curPrice.dayBeforePrice),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class PriceCard extends StatelessWidget {
  final String product;
  final int todayPrice;
  final int prevDayPrice;
  final String unit;
  const PriceCard(
      {Key? key,
      required this.product,
      required this.unit,
      required this.todayPrice,
      required this.prevDayPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 50),
        decoration: BoxDecoration(
            border: Border(left: BorderSide(color: Colors.blue, width: 5))),
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$product",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: "RobotMono"),
                ),
                Text(
                  "Unit - $unit",
                  style: TextStyle(
                    fontSize: 18,
                  ),
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
                          "$prevDayPrice birr",
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
                        "$todayPrice birr",
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
