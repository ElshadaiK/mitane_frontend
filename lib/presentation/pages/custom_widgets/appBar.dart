import 'package:flutter/material.dart';
import 'package:mitane_frontend/presentation/pages/custome_widgets/drawer.dart';
class DrawerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home", style: TextStyle(fontSize: 18, color: Colors.white70),), elevation: 10, backgroundColor: Colors.blue,
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.notifications),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
      drawer: NavDrawer(),
    );
  }
}