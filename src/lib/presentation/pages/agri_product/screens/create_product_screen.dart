import 'package:flutter/material.dart';

class CreateProductScreen extends StatefulWidget {
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
  static const List<String> _item = [
    "Fruits",
    "Vegitable",
    "Dairy Product",
    "Ceral",
    "Fruit",
    "Vegiable",
    "Daiy Product",
    "Ceal"
  ];
  const CreateProductScreen({Key? key}) : super(key: key);

  List<String> getCategory() => _category;
  List<String> getItem() => _item;

  @override
  _CreateProductScreenState createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateProductScreen> {
  String? _selectedCategory;
  String? _selectedItem;

  @override
  void initState() {
    _selectedCategory = widget.getCategory()[0];
    _selectedItem = widget.getItem()[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Product"),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 30, right: 30, top: 40),
              height: MediaQuery.of(context).size.height * 0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Category",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: "RobotMono"),
                      ),
                      Container(
                        width: (MediaQuery.of(context).size.width * 40) / 100,
                        padding: EdgeInsets.only(left: 15.0),
                        decoration: BoxDecoration(
                            color: Color(0xFF8CC63E),
                            borderRadius: BorderRadius.circular(20)),
                        child: DropdownButton(
                          menuMaxHeight: 5 * 48,
                          value: _selectedCategory,
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
                              _selectedCategory = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Items",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: "RobotMono"),
                      ),
                      Container(
                        width: (MediaQuery.of(context).size.width * 40) / 100,
                        padding: EdgeInsets.only(left: 15.0),
                        decoration: BoxDecoration(
                            color: Color(0xFF8CC63E),
                            borderRadius: BorderRadius.circular(20)),
                        child: DropdownButton(
                          menuMaxHeight: 5 * 48,
                          value: _selectedItem,
                          dropdownColor: Colors.white,
                          underline: Container(color: Colors.transparent),
                          items: widget
                              .getItem()
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
                              _selectedItem = value;
                            });
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Form(
           
              child: Container(
                height: MediaQuery.of(context).size.height * 0.45,
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter a search term'),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter a search term'),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFF8CC63E),
                              fixedSize: Size(
                                  MediaQuery.of(context).size.width * 0.4,
                                  MediaQuery.of(context).size.height * 0.06),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0))),
                          onPressed: () {
                            print("created");
                          },
                          child: Text(
                            "Create",
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: "RobotMono"),
                          )),
                    ])
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
