import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mitane_frontend/presentation/pages/common/mitaneButton.dart';

class AdminUserEdit extends StatefulWidget {
  static const String routeName = '/edituser';
  static const List<String> role = [
    "Farmer",
    "User",
    "Data Encoder",
  ];
  List<String> getrole() => role;


  @override
  _AdminUserEditState createState() => _AdminUserEditState();
}

class _AdminUserEditState extends State<AdminUserEdit> {
  String? selectedrole = "";

  String? get() => selectedrole;


  @override
  void initState() {
    super.initState();
    selectedrole = widget.getrole()[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add User",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/adminusers');
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
          component(context, "Role", AdminUserEdit.role, selectedrole),
          Container(
              margin: EdgeInsets.all(40),
              child: Column(
                children: [
                  TextFormField(
                    initialValue: "Named",
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      labelText: "User Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    initialValue: "+251900000000",
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                        labelText: "Phone No",
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    initialValue: "********",
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    MitaneButton(onPressed: () => { Navigator.pop(context) }, title: "Edit User Profile", )
                  ])
                ],
              ))
        ],
      ),
    );
  }

  Widget component(BuildContext context, String title, List<String> values,
      String? selected) {
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
              dropdownColor: Color(0xFF8CC63E),
              underline: Container(color: Colors.transparent),
              items: values.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  selected = value;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
