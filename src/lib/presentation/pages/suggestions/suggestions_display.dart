import 'package:flutter/material.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/drawer.dart';
import 'package:mitane_frontend/presentation/pages/suggestions/vertical_tiles_display.dart';

class SuggestionsDisplay extends StatefulWidget {
  SuggestionsDisplay({Key? key}) : super(key: key);

  @override
  _SuggestionsDisplayState createState() => _SuggestionsDisplayState();
}

class _SuggestionsDisplayState extends State<SuggestionsDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text(
          "Suggestions",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: NavDrawer(),
      body: SafeArea(
        child: Container(
          width: (MediaQuery.of(context).size.width),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Your Farm tells a story",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0x8CC63E).withOpacity(1),
                ),
              ),
              Container(
                child: Expanded(
                  child: VerticalCardPagerDemo(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}