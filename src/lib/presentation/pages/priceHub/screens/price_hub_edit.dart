import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mitane_frontend/models/store-model.dart';
import 'package:mitane_frontend/presentation/pages/common/DropdownComponent.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/drawer.dart';
import 'package:mitane_frontend/presentation/pages/priceHub/screens/price_hub_data_encoder_screen.dart';
import 'package:mitane_frontend/presentation/pages/priceHub/screens/price_hub_edit.dart';

class PriceHubEdit extends StatefulWidget {
  static const String routeName = '/editPrice';
  static const List<String> category = [
    "Fruits",
    "Vegetable",
    "Dairy Product",
    "Cereal",
    "Fruit"
  ];

  static const List<String> item = [
    "Banana",
    "Apple",
    "Grapes",
    "Maize",
    "Corn",
  ];

  // StoreEdit.pop(context);

  List<String> getCategory() => category;
  List<String> getItem() => item;

  @override
  _PriceHubEditState createState() => _PriceHubEditState();
}

class _PriceHubEditState extends State<PriceHubEdit> {
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
          "Edit Item",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/');
            },
            icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          DropDownComponent(context: context, title: "Category", values: PriceHubEdit.category, selected: selectedCategory),
          DropDownComponent(context: context, title: "Item", values: PriceHubEdit.item, selected: selectedItem),
          Container(
              margin: EdgeInsets.all(40),
              child: Column(
                children: [
                  TextFormField(
                    initialValue: '150 Birr',
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      labelText: "Yesterday's Price",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextFormField(
                    initialValue: '150 Birr',
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      labelText: "Today's Price",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    initialValue: 'kg',
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                        labelText: "Quantity Unit",
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Update'),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF8CC63E),
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                          textStyle: TextStyle(fontSize: 20),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }

}
