import 'package:flutter/material.dart';
import 'package:mitane_frontend/presentation/app_widget.dart';
import 'package:mitane_frontend/presentation/home.dart';
import 'package:mitane_frontend/priceHub/screens/price_hub_screen.dart';
import 'package:mitane_frontend/agri_product/screens/product_display_screen.dart';
import 'package:mitane_frontend/agri_product/screens/create_product_screen.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => AppWidget());
      case '/home':
        return MaterialPageRoute(builder: (_) => ProductScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => ProductScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => ProductScreen());
      case '/productDetail':
        return MaterialPageRoute(builder: (_) => HomePage());

      case '/pricehub':
        return MaterialPageRoute(builder: (_) => PriceHub());
      case '/products':
        return MaterialPageRoute(builder: (_) => ProductScreen());
      case '/machinery':
        return MaterialPageRoute(builder: (_) => ProductScreen());
      case '/store':
        return MaterialPageRoute(builder: (_) => ProductScreen());
      case '/postProduct':
        return MaterialPageRoute(builder: (_) => CreateProductScreen());
      case '/postInput':
        return MaterialPageRoute(builder: (_) => ProductScreen());
      case '/postMachinery':
        return MaterialPageRoute(builder: (_) => ProductScreen());
      case '/updateProduct':
        return MaterialPageRoute(builder: (_) => ProductScreen());
      case '/updateMachinery':
        return MaterialPageRoute(builder: (_) => ProductScreen());
      case '/updateInput':
        return MaterialPageRoute(builder: (_) => ProductScreen());
      case '/profile':
        return MaterialPageRoute(builder: (_) => ProductScreen());
      case '/service':
        return MaterialPageRoute(builder: (_) => ProductScreen());
      default:
        return MaterialPageRoute(builder: (_) => ProductScreen());
    }
  }
}
