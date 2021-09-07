import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mitane_frontend/models/store-model.dart';
import 'package:mitane_frontend/presentation/pages/common/DropdownComponent.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/drawer.dart';
import 'package:mitane_frontend/presentation/pages/farmer/store_screen.dart';

class StoreAdd extends StatefulWidget {
  static const String routeName = '/addstore';
  static const List<String> category = [
    "Fruits",
    "Vegetable",
    "Dairy Product",
    "Cereal",
    "Fruit",
  ];

  static const List<String> item = [
    "Banana",
    "Apple",
    "Grapes",
    "Maize",
    "Corn",
  ];

  List<String> getCategory() => category;
  List<String> getItem() => item;

  @override
  _StoreAddState createState() => _StoreAddState();
}

class _StoreAddState extends State<StoreAdd> {
  String? selectedCategory = "";

  String? get() => selectedCategory;
  String? selectedItem = "";

  String? getI() => selectedItem;

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.getCategory()[0];
    selectedItem = widget.getItem()[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Item",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/');
            },
            icon: Icon(Icons.arrow_back)),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          DropDownComponent(context: context, title: "Category", values: StoreAdd.category, selected: selectedCategory),
          DropDownComponent(context: context, title: "Item", values: StoreAdd.item, selected: selectedItem),
          Container(
              margin: EdgeInsets.all(40),
              child: Column(
                children: [
                  TextFormField(
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      labelText: "Price",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                        labelText: "Quantity Unit",
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Add to Store'),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF8CC63E),
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                          textStyle: TextStyle(fontSize: 20),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                        ))
                  ])
                ],
              ))
        ],
      ),
    );
  }

}
