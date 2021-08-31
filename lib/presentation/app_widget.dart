import 'package:flutter/material.dart';
import 'package:mitane_frontend/models/price-model.dart';
import 'package:mitane_frontend/models/store-model.dart';

import 'package:mitane_frontend/presentation/pages/farmer/store_add_screen.dart';
import 'package:mitane_frontend/presentation/pages/farmer/store_edit_screen.dart';
import 'package:mitane_frontend/presentation/pages/farmer/store_screen.dart';



class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: StoreDisplay.routeName,
      routes: {
        StoreDisplay.routeName: (BuildContext context) => StoreDisplay(items: [new Store("Banana", 80, 25), new Store("Banana", 80, 25), new Store("Banana", 80, 25), ],),
        StoreEdit.routeName: (BuildContext context) => StoreEdit(),
        StoreAdd.routeName: (BuildContext context) => StoreAdd(),


      },
    );
  }
}