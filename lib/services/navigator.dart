import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class NavigationService {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final drawerController = ZoomDrawerController();
  Future<dynamic> navigateTo(Widget page){
    return navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) => page));
  }

  void goBack(){
    return navigatorKey.currentState!.pop();
  }
}
