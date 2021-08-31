import 'package:flutter/material.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/custom_list_tile.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/drawer.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/widgets/bubbles.dart';

class MachineryScreen extends StatefulWidget {
  const MachineryScreen({Key? key}) : super(key: key);

  @override
  _MachineryScreenState createState() => _MachineryScreenState();
}

class _MachineryScreenState extends State<MachineryScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/');
                },
                icon: Icon(Icons.arrow_back)),
            title: Container(
              height: 35.0,
              child: TextField(
                showCursor: false,
                textAlignVertical: TextAlignVertical.bottom,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    hintText: 'search machinery'),
              ),
            ),
          ),
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
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    horizontalScrollList(context),
                    verticalScrollList(context)
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}

Widget horizontalScrollList(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.12,
    padding: EdgeInsets.symmetric(vertical: 5.0),
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int itemCount) {
          return GestureDetector(
            onTap: () => Navigator.of(context).pushNamed("/productDetail"),
            child: Container(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/machinery.jpg"),
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(1.0), BlendMode.dstATop),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Center(
                    child: Text(
                      "Tractor",
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
  );
}

Widget verticalScrollList(BuildContext context) {
  return Expanded(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int itemCount) {
          return GestureDetector(
            onTap: () => Navigator.of(context).pushNamed("/productDetail"),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
              child: CustomTile(
                product: "Tractor",
                quantity: "10",
                price: "300",
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
