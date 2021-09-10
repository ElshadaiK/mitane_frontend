import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mitane_frontend/application/user/bloc/user_blocs.dart';
import 'package:mitane_frontend/domain/user/entity/user_models.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/widgets/bubbles.dart';
import 'package:mitane_frontend/presentation/pages/user/screens/UserAdmin_Lists.dart';
import 'package:mitane_frontend/presentation/pages/common/mitaneButton.dart';

class AdminUserAdd extends StatefulWidget {
  static const String routeName = '/admin/users/add';

  @override
  _AdminUserAddState createState() => _AdminUserAddState();
}

class _AdminUserAddState extends State<AdminUserAdd> {

  final Map<String, dynamic> _user = {};
  final _formKey = GlobalKey<FormState>();


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
          child:  Container(
            height: MediaQuery.of(context).size.height,
            child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
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
                              labelText: "Role", border: OutlineInputBorder()),
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
                              final UserEvent event = UserAdminCreate(
                                User(
                                  id: null,
                                  name: this._user["name"],
                                  phoneNo: double.parse(this._user["phoneNo"]),
                                  password: this._user["password"],
                                  roles: this._user["roles"],
                                ),
                              );
                              BlocProvider.of<UserBloc>(context).add(event);
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  AdminUsers.routeName, (route) => false);
                            }
                          },
                          title: "Add User",
                        )
                      ])
                    ],
                  ))
            ],
          ),
        ))
        )]));
  }
}
