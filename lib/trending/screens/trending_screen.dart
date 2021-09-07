import 'package:flutter/material.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/custom_list_tile.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/drawer.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/widgets/bubbles.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({Key? key}) : super(key: key);

  @override
  _TrendingScreenState createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(
          "Trending Products",
          style: TextStyle(color: Colors.black),
        ),
          ),
          drawer: NavDrawer(),
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
            Positioned(
              child: Container(
                width: 400,
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/trending.png"))),
              ),
              bottom: -15,
              left: -20,
            ),
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    verticalScrollList(context)
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}


Widget verticalScrollList(BuildContext context) {
  return Expanded(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int itemCount) {
          return GestureDetector(
            onTap: () => Navigator.of(context).pushNamed("/productDetail"),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
              child: CustomTile(
                product: "Tractor",
                quantity: "10",
                price: "1000",
                category: "vechile",
              ),
            ),
          );
        },
      ),
    ),
  );
}

class ProductSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear)),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, "");
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text(query);
  }
}
