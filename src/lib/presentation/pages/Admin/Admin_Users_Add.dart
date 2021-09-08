import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mitane_frontend/presentation/pages/common/DropdownComponent.dart';
import 'package:mitane_frontend/presentation/pages/common/mitaneButton.dart';

class AdminUserAdd extends StatefulWidget {
  static const String routeName = '/adduser';
  static const List<String> role = [
    "Farmer",
    "User",
    "Data Encoder",
  ];
  List<String> getrole() => role;


  @override
  _AdminUserAddState createState() => _AdminUserAddState();
}

class _AdminUserAddState extends State<AdminUserAdd> {
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
          DropDownComponent(context: context, title: "Role", values: AdminUserAdd.role, selected: selectedrole),
          Container(
              margin: EdgeInsets.all(40),
              child: Column(
                children: [
                  TextFormField(
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
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                        labelText: "Phone No",
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    MitaneButton(onPressed: () => { Navigator.pop(context) }, title: "Add User", )
                  ])
                ],
              ))
        ],
      ),
    );
  }

}