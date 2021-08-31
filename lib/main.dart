import 'package:flutter/material.dart';
import 'package:mitane_frontend/presentation/app_widget.dart';
import 'package:mitane_frontend/route_generator.dart';
 
void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  onGenerateRoute: RouteGenerator.generateRoute,
));
 
