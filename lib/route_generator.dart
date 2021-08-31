import 'package:flutter/material.dart';
import 'package:mitane_frontend/agri_inputs/inputs.dart';
import 'package:mitane_frontend/machinery/screens/machinery_screen.dart';
import 'package:mitane_frontend/presentation/pages/farmer/app_widget.dart';
import 'package:mitane_frontend/presentation/pages/farmer/home.dart';
import 'package:mitane_frontend/priceHub/screens/price_hub_screen.dart';
import 'package:mitane_frontend/agri_product/screens/product_display_screen.dart';
import 'package:mitane_frontend/agri_product/screens/create_product_screen.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => AppWidget());

      case '/login':
        return MaterialPageRoute(builder: (_) => ProductScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => ProductScreen());
      case '/pricehub':
        return MaterialPageRoute(builder: (_) => PriceHub());
      case '/product':
        return MaterialPageRoute(builder: (_) => ProductScreen());
      case '/machinery':
        return MaterialPageRoute(builder: (_) => MachineryScreen());
      case '/inputs':
        return MaterialPageRoute(builder: (_) => IngredientScreen());
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
