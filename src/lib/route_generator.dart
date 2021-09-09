import 'package:flutter/material.dart';
import 'package:mitane_frontend/Admin/models/User.dart';
import 'package:mitane_frontend/Admin/screens/UserAdmin_Add.dart';
import 'package:mitane_frontend/Admin/screens/UserAdmin_Edit.dart';
import 'package:mitane_frontend/Admin/screens/UserAdmin_Lists.dart';
import 'package:mitane_frontend/presentation/pages/agri_inputs/screens/ingredient_page.dart';
import 'package:mitane_frontend/presentation/pages/agri_product/screens/product_display_screen.dart';
import 'package:mitane_frontend/presentation/pages/common/splash/splash.dart';
import 'package:mitane_frontend/presentation/pages/common/welcome.dart';
import 'package:mitane_frontend/presentation/pages/farmer/app_widget.dart';
import 'package:mitane_frontend/presentation/pages/machinery/screens/machinery_screen.dart';
import 'package:mitane_frontend/presentation/pages/priceHub/screens/price_hub_screen.dart';
import 'package:mitane_frontend/presentation/pages/sign_in/Login_screen.dart';
import 'package:mitane_frontend/presentation/pages/suggestions/suggestions.dart';

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
      case '/admin/users':
        return MaterialPageRoute(builder: (_) => AdminUsers());
      case '/admin/users/add':
        return MaterialPageRoute(builder: (_) => AdminUserAdd());
      // case '/admin/users/edit':
      //   return MaterialPageRoute(builder: (_) => AdminUserEdit(argument: ,));
      default:
        return MaterialPageRoute(builder: (_) => ProductScreen());
    }
  }
}

class UserArgument {
  final User user;
  UserArgument({required this.user});
}
