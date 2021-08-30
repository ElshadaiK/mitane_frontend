import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StoreEdit extends StatefulWidget {
  const StoreEdit({ Key? key }) : super(key: key);
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

  @override
  _StoreEditState createState() => _StoreEditState();
}

class _StoreEditState extends State<StoreEdit> {
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
        ],
      ),
    );
  }
}

