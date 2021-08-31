import 'package:flutter/material.dart';

class Constants {
  static String appName = "Smile";

  //Colors for theme
  static Color lightPrimary = Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Colors.blue;
  static Color darkAccent = Colors.blueAccent;
  static Color lightBG = Color(0xfffcfcff);
  static Color darkBG = Colors.black;

  static Color primary = Color(0xff00B7EB);
  static List<BoxShadow> shadow = [
    BoxShadow(
      color: const Color(0xffe6ecf4),
      offset: Offset(0, 2),
      blurRadius: 4,
    ),
  ];

  static BoxDecoration cardDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10.0),
    color: const Color(0xffffffff),
    boxShadow: Constants.shadow,
  );

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: lightAccent,
    ),
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: darkBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: darkAccent,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: lightBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );

  static Row buildRating(double rate, [showText = false]) {
    int full = rate.floor();
    double forkes = rate - full;
    int half = forkes.round();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for (var i = 0; i < full; i++)
          Icon(
            Icons.star,
            color: Color(0xFFFFD138),
            size: 15,
          ),
        if (half == 1)
          Icon(
            Icons.star_half,
            color: Color(0xFFFFD138),
            size: 15,
          ),
        for (int i = 0; i < (5 - (full + half)); i++)
          Icon(
            Icons.star,
            color: Colors.black,
            size: 15,
          ),
        if (showText)
          Text(rate.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
      ],
    );
  }
}
