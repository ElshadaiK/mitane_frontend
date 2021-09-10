import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mitane_frontend/application/user/bloc/user_blocs.dart';
import 'package:mitane_frontend/domain/user/entity/user_models.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/widgets/bubbles.dart';
import 'package:mitane_frontend/presentation/pages/user/screens/UserAdmin_Edit.dart';

import 'package:mitane_frontend/presentation/pages/common/SlideEditAndDelete.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/drawer.dart';
import 'package:mitane_frontend/route_generator.dart';

import 'UserAdmin_Add.dart';

class AdminUsers extends StatefulWidget {
  static const routeName = '/admin/users';

  static User editArg = User(id: "", name: "", phoneNo: 0, password: "", roles: "");
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
            child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: BlocBuilder<UserBloc, UserState>(
              builder: (_, state) {
                if (state is UserAdminOperationFailure) {
                  return Text('Could not do course operation');
                }

                if (state is UserAdminOperationSuccess) {
                  final users = state.users;

                  return ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (_, int index) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          margin: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          child: Dismissible(
                            child: UserCard(
                              userName: users.elementAt(index).name,
                              phoneNo: users.elementAt(index).phoneNo,
                              role: users.elementAt(index).roles,
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
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context, false);
                                            },
                                          ),
                                          TextButton(
                                            child: Text(
                                              "Delete",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                BlocProvider.of<UserBloc>(
                                                        context)
                                                    .add(UserAdminDelete(users
                                                        .elementAt(index)
                                                        .id
                                                        .toString()));
                                                Navigator.of(context)
                                                    .pushNamedAndRemoveUntil(
                                                        AdminUsers.routeName,
                                                        (route) => false);
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    });
                                return res;
                              } else if (direction ==
                                  DismissDirection.startToEnd) {
                                     AdminUsers.editArg = users.elementAt(index);
                                Navigator.of(context).pushNamed(
                                  AdminUserEdit.routeName,
                                  arguments: UserArgument(
                                      user: users.elementAt(index)),
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
      ))]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(
          AdminUserAdd.routeName,
        ),
        child: const Icon(
          Icons.add,
          color: Colors.green,
        ),
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
              border:
                  Border(left: BorderSide(color: Color(0xDD8CC63E), width: 5))),
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            FaIcon(
              FontAwesomeIcons.userCircle,
              color: Color(0xDD8CC63E),
              size: 50,
            ),
            SizedBox(
              width: 15,
            ),
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
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                          style:
                              TextStyle(fontSize: 16, fontFamily: "RobotMono"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "+$phoneNo",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ])),
    );
  }
}
