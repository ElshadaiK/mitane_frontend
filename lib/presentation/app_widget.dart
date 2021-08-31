import 'package:flutter/material.dart';
import 'package:mitane_frontend/models/price-model.dart';
import 'package:mitane_frontend/models/store-model.dart';

import 'package:mitane_frontend/presentation/pages/signup/farmer_sign_up2_page.dart';
import 'package:mitane_frontend/presentation/pages/signup/farmer_sign_up_page.dart';
import 'package:mitane_frontend/presentation/pages/store_edit_screen.dart';
import 'package:mitane_frontend/presentation/pages/store_screen.dart';


import 'pages/price_hub_screen.dart';


class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: StoreDisplay.routeName,
      routes: {
        StoreDisplay.routeName: (BuildContext context) => StoreDisplay(items: [new Store("Banana", 80, 25)],),
        StoreEdit.routeName: (BuildContext context) => StoreEdit(),

      },
    );
  }
}