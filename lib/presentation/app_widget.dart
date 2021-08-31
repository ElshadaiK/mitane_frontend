import 'package:flutter/material.dart';
import 'package:mitane_frontend/presentation/pages/splash/splash.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
      // initialRoute: StoreDisplay.routeName,
      // routes: {
      //   StoreDisplay.routeName: (BuildContext context) => StoreDisplay(
      //         [],
      //         items: [new Store("Banana", 80, 25)],
      //       ),
      // },
    );
  }
}
