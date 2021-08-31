import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mitane_frontend/models/price-model.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/widgets/bubbles.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/drawer.dart';

class PriceHub extends StatefulWidget {
  @override
  _PriceHubState createState() => _PriceHubState();
}

class _PriceHubState extends State<PriceHub> {
  String? selectedCategory = "";

  String? get() => selectedCategory;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Price Hub",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: NavDrawer(),
      body: Stack(children: [
            Positioned(
              child: Bubble(
                height: 160.0,
                width: 160.0,
              ),
              top: -5,
              left: -160,
            ),
            Positioned(
              child: Bubble(
                height: 250.0,
                width: 250,
              ),
              top: 130,
              left: 180,
            ),
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    child: PriceCard(
                        product: "Product Name",
                        unit: "Kg",
                        todayPrice: 124,
                        prevDayPrice: 120),
                  );
                }),

              ),
            ),
          ]),

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
      elevation: 3,
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 50),
        decoration: BoxDecoration(
            border: Border(left: BorderSide(color: Colors.blue, width: 5))),
        height: 80,
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
