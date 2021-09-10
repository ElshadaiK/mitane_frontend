import 'package:flutter/material.dart';
import 'package:mitane_frontend/domain/ingredient/entity/ingredient_model.dart';
import 'package:mitane_frontend/domain/machinery/entity/machinery_model.dart';
import 'package:mitane_frontend/domain/product/entity/product_model.dart';

import 'package:mitane_frontend/domain/user/entity/user_models.dart';
import 'package:mitane_frontend/presentation/pages/agri_inputs/screens/IngredientAdmin_Add.dart';
import 'package:mitane_frontend/presentation/pages/agri_inputs/screens/IngredientAdmin_Lists.dart';
import 'package:mitane_frontend/presentation/pages/machinery/screens/MachineryAdmin_Add.dart';
import 'package:mitane_frontend/presentation/pages/machinery/screens/MachineryAdmin_Lists.dart';
import 'package:mitane_frontend/presentation/pages/agri_product/screens/ProductAdmin_Add.dart';
import 'package:mitane_frontend/presentation/pages/agri_product/screens/ProductAdmin_Lists.dart';
import 'package:mitane_frontend/presentation/pages/user/screens/UserAdmin_Add.dart';
import 'package:mitane_frontend/presentation/pages/user/screens/UserAdmin_Lists.dart';
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

import 'package:mitane_frontend/presentation/pages/suggestions/suggestions_display.dart';


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
      case '/admin/machineries':
        return MaterialPageRoute(builder: (_) => AdminMachineries());
      case '/admin/machineries/add':
        return MaterialPageRoute(builder: (_) => AdminMachineryAdd());
      case '/admin/products':
        return MaterialPageRoute(builder: (_) => AdminProducts());
      case '/admin/products/add':
        return MaterialPageRoute(builder: (_) => AdminProductAdd());
      case '/admin/ingredients':
        return MaterialPageRoute(builder: (_) => AdminIngredients());
      case '/admin/ingredients/add':
        return MaterialPageRoute(builder: (_) => AdminIngredientAdd());
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

class ProductArgument {
  final Product product;
  ProductArgument({required this.product});
}

class MachineryArgument {
  final Machinery machinery;
  MachineryArgument({required this.machinery});
}

class IngredientArgument {
  final Ingredient ingredient;
  IngredientArgument({required this.ingredient});
}
