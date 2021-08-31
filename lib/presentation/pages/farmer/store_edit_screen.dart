import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mitane_frontend/models/store-model.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/drawer.dart';
import 'package:mitane_frontend/presentation/pages/farmer/store_screen.dart';

class StoreEdit extends StatefulWidget {
  static const String routeName = '/editstore';
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
  _StoreEditState createState() => _StoreEditState();
}

class _StoreEditState extends State<StoreEdit> {
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
          SizedBox(height: 15,),
          component(context, "Category", StoreEdit.category, selectedCategory),
          component(context, "Item", StoreEdit.item, selectedItem),
          Container(
            margin: EdgeInsets.all(40),
            child: Column(
              children: [
                TextFormField(
                  initialValue: '150 Birr',
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    labelText: "Price",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 40.0,),
                TextFormField(
                  initialValue: 'kg',
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    labelText: "Quantity Unit",
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 40.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },  
                      child: Text('Update'),              
                      style:  
                        ElevatedButton.styleFrom(
                          primary: Color(0xFF8CC63E),
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),                       
                          textStyle: TextStyle(
                            fontSize: 20
                          ),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                        ),
                    ),
                  ],
                )
                
                                       
              ],

            )
            
          )
          
        ],
      ),
    );
  }

  Widget component(BuildContext context,String title, List<String> values, String? selected ){
    return Container(
            padding: const EdgeInsets.only(top: 8, bottom: 30),
            margin: EdgeInsets.only(top: 10, bottom: 0.0, left: 40, right: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$title",
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
                    value: selected,
                    dropdownColor: Colors.white,
                    underline: Container(color: Colors.transparent),
                    items: values
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black45),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newvalue) {
                      setState(() {
                        selected = newvalue;
                      });
                    },
                  ),
                )
              ],
            ),
          );
  
  }

}

