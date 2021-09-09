import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mitane_frontend/Admin/blocs/UserAdmin_Blocs.dart';
import 'package:mitane_frontend/Admin/models/User.dart';
// import 'package:mitane_frontend/domain/auth/entity/auth_model.dart';
import 'package:mitane_frontend/presentation/pages/Admin/Admin_Users_Edit.dart';
import 'package:mitane_frontend/presentation/pages/common/SlideEditAndDelete.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/drawer.dart';
import 'package:mitane_frontend/route_generator.dart';

import 'UserAdmin_Add.dart';

class AdminUsers extends StatefulWidget {
  static const routeName = '/admin/users';

  get curPrice => null;
  @override
  _AdminUsersState createState() => _AdminUsersState();
}

class _AdminUsersState extends State<AdminUsers> {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        title: Text(
          "Users",
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
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (BuildContext context, int itemCount) {
                  return GestureDetector(
                    // onTap: () => Navigator.of(context).pushNamed("/productDetail"),
                    child: Container(
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            width: MediaQuery.of(context).size.width * 0.4,                 
                            decoration: BoxDecoration(
                                color: Color(0xDD8CC63E),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          Center(
                            child: Text(
                              "User Role",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "RobotMono",
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
            child: BlocBuilder<UserAdminBloc, UserAdminState>(
              builder: (_, state) {
                if (state is UserAdminOperationFailure) {
                  return Text('Could not do course operation');
                }

                if (state is UserAdminOperationSuccess) {
                  final users = state.users;

                  return 
                  ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (_, int index) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),                    
                        child: Dismissible(                    
                            child: UserCard(
                                userName: users.elementAt(index).name,
                                phoneNo: users.elementAt(index).phoneNo,
                                role: users.elementAt(index).roles.toString(),
                            ),
                            background: slideRightBackground(),
                            secondaryBackground: slideLeftBackground(),
                            key: ValueKey<User>(users.elementAt(index)),
                            confirmDismiss: (direction) async {
                            if (direction == DismissDirection.endToStart) {
                              final bool res = await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: Text(
                                          "Are you sure you want to delete ${users.elementAt(index).name}?"),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text(
                                            "Cancel",
                                            style: TextStyle(color: Colors.black),
                                          ),
                                          onPressed: () {                                        
                                            Navigator.pop(context, false);
                                          },
                                        ),
                                        TextButton(
                                          child: Text(
                                            "Delete",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              BlocProvider.of<UserAdminBloc>(context)
                                                  .add(UserAdminDelete(users.elementAt(index).id.toString()));
                                              Navigator.of(context).pushNamedAndRemoveUntil(
                                                  AdminUsers.routeName, (route) => false);
                                            });
                                          },
                                        ),
                                      ],
                                    );
                                  });
                              return res;
                            } else if (direction == DismissDirection.startToEnd){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => AdminUserEdit()),
                                );
                              }
                            },
                          ),
                      );
                      
                  });
                }

                return CircularProgressIndicator();
              },
            ),
            
            
            
          ),         
        ],
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(
          AdminUserAdd.routeName,
          arguments: UserArgument(edit: false),
        ),      
        child: const Icon(Icons.add, color: Colors.green,),
        backgroundColor: Colors.white,
      ),
    );
  
  }
}

class UserCard extends StatelessWidget {
  final String userName;
  final double phoneNo;
  final String role;
  const UserCard(
      {Key? key,
      required this.userName,
      required this.phoneNo,
      required this.role})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
            border: Border(
                left: BorderSide(
                    color: Color(0xDD8CC63E),
                    width: 5))),
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: 
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FaIcon(
              FontAwesomeIcons.userCircle,
              color: Color(0xDD8CC63E),
              size: 50,
            ),

            SizedBox(width: 15,),
            Column(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$userName",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: "RobotMono"),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Role:",
                          style: TextStyle(fontSize: 16, fontFamily: "RobotMono"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "$role",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Phone No:",
                        style: TextStyle(fontSize: 16, fontFamily: "RobotMono"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "$phoneNo",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          ]
        )
      ),
    );
  }
}