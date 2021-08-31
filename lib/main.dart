import 'package:flutter/material.dart';
import 'package:mitane_frontend/presentation/app_widget.dart';
import 'package:mitane_frontend/presentation/pages/common/splash/splash.dart';
import 'package:mitane_frontend/route_generator.dart';
 
void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  // initialRoute: '/',
  home: Splash(),
  // onGenerateRoute: RouteGenerator.generateRoute,
));
 
