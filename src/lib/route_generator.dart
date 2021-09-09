import 'package:flutter/material.dart';
import 'package:mitane_frontend/presentation/pages/agri_inputs/screens/ingredient_page.dart';
import 'package:mitane_frontend/presentation/pages/agri_product/screens/product_display_screen.dart';
import 'package:mitane_frontend/presentation/pages/common/splash/splash.dart';
import 'package:mitane_frontend/presentation/pages/common/welcome.dart';
import 'package:mitane_frontend/presentation/pages/farmer/app_widget.dart';
import 'package:mitane_frontend/presentation/pages/machinery/screens/machinery_screen.dart';
import 'package:mitane_frontend/presentation/pages/priceHub/screens/price_hub_screen.dart';
import 'package:mitane_frontend/presentation/pages/sign_in/Login_screen.dart';
import 'package:mitane_frontend/presentation/pages/suggestions/suggestions.dart';
import 'package:mitane_frontend/presentation/pages/priceHub/screens/price_hub_data_encoder_screen.dart';
import 'package:mitane_frontend/presentation/pages/priceHub/screens/price_hub_edit.dart';
import 'package:mitane_frontend/presentation/pages/priceHub/screens/price_hub_add_screen.dart';
import 'package:mitane_frontend/presentation/pages/Data_encoder/data_encoder_home.dart';
import 'package:mitane_frontend/presentation/pages/Data_encoder/app_widget.dart';
import 'package:mitane_frontend/models/price-model.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => AppWidget());
      case '/splash':
        return MaterialPageRoute(builder: (_) => Splash());
      case '/welcome':
        return MaterialPageRoute(builder: (_) => WelcomePage());
      case '/login':
        return MaterialPageRoute(builder: (_) => LogIn());
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
      case '/suggestions':
        return MaterialPageRoute(builder: (_) => Suggestions());
      default:
        return MaterialPageRoute(builder: (_) => ProductScreen());
    }
  }
}
