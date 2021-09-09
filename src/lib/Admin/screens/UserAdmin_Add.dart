import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitane_frontend/Admin/blocs/UserAdmin_Blocs.dart';
import 'package:mitane_frontend/Admin/models/User.dart';
import 'package:mitane_frontend/Admin/screens/UserAdmin_Lists.dart';
import 'package:mitane_frontend/presentation/pages/common/mitaneButton.dart';

class AdminUserAdd extends StatefulWidget {
  static const String routeName = '/admin/users/add';
  // static const List<String> role = [
  //   "Farmer",
  //   "User",
  //   "Data Encoder",
  // ];
  // List<String> getrole() => role;


  @override
  _AdminUserAddState createState() => _AdminUserAddState();
}

class _AdminUserAddState extends State<AdminUserAdd> {
  // String? selectedrole = "";

  // String? get() => selectedrole;

  final Map<String, dynamic> _user = {};
  final _formKey = GlobalKey<FormState>();


  // @override
  // void initState() {
  //   super.initState();
  //   selectedrole = widget.getrole()[0];
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add New User",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AdminUsers.routeName);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          // DropDownComponent(context: context, title: "Role", values: AdminUserAdd.role, selected: selectedrole),
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
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter user name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        this._user["name"] = value;
                      });
                  }),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                        labelText: "Phone No",
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter user phone number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        this._user["phoneNo"] = value;
                      });
                  }),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                        labelText: "Roles",
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter user role';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        this._user["roles"] = (value);
                      });
                  }),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter user passwordr';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        this._user["password"] = value;
                      });
                  }),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    MitaneButton(
                      onPressed: () {
                    final form = _formKey.currentState;
                    if (form != null && form.validate()) {
                      form.save();
                      final UserAdminEvent event = UserAdminCreate(
                              User(
                                id: null,
                                name: this._user["name"],
                                phoneNo: double.parse(this._user["phoneNo"]),
                                password: this._user["password"],
                                roles: this._user["roles"].split(','),
                              ),
                            );
                      BlocProvider.of<UserAdminBloc>(context).add(event);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          AdminUsers.routeName, (route) => false);
                    }                    
                    }, title: "Add User", )
                  ])
                ],
              ))
        ],
      ),
    ));
  }

}