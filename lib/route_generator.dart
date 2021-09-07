import 'package:flutter/material.dart';
import 'package:mitane_frontend/domain/entity/user_model.dart';
import 'package:mitane_frontend/presentation/pages/Admin/Admin_Home.dart';
import 'package:mitane_frontend/presentation/pages/Admin/Admin_Users.dart';
import 'package:mitane_frontend/presentation/pages/agri_inputs/screens/ingredient_page.dart';
import 'package:mitane_frontend/presentation/pages/agri_product/screens/product_display_screen.dart';
import 'package:mitane_frontend/presentation/pages/common/splash/splash.dart';
import 'package:mitane_frontend/presentation/pages/common/welcome.dart';
import 'package:mitane_frontend/presentation/pages/farmer/app_widget.dart';
import 'package:mitane_frontend/presentation/pages/farmer/store_edit_screen.dart';
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
      case '/Login':
        return MaterialPageRoute(builder: (_) => LogIn());
      case '/welcome':
        return MaterialPageRoute(builder: (_) => WelcomePage());
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
      case '/suggestions':
        return MaterialPageRoute(builder: (_) => Suggestions());
      case '/adminhome':
        return MaterialPageRoute(builder: (_) => AdminHome());
      case '/adminusers':
        return MaterialPageRoute(
            builder: (_) => AdminUsers(items: [
                  User(
                      name: "Named",
                      token: "",
                      phone: "+25100000000000",
                      role: "Farmer",
                      password: "")
                ]));
      case '/editstore':
        return MaterialPageRoute(builder: (_) => StoreEdit());
      case '/editPrice':
        return MaterialPageRoute(builder: (_) => PriceHubEdit());
      case '/addPrice':
        return MaterialPageRoute(builder: (_) => PriceHubAdd());
      case '/priceHubDE':
        return MaterialPageRoute(builder: (_) => PriceHubDisplay(
                items: [
                  
              new Price("Banana", 'kg', 25, 30),
              new Price("Banana", 'kg', 25, 30),
              new Price("Banana", 'kg', 25, 30),
            ],
        ));
      default:
        return MaterialPageRoute(builder: (_) => ProductScreen());
    }
  }
}
