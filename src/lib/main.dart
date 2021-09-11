import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitane_frontend/application/auth/bloc/status_bloc.dart';
import 'package:mitane_frontend/application/auth/events/status_events.dart';
import 'package:mitane_frontend/application/auth/states/status_state.dart';
import 'package:mitane_frontend/application/ingredient/bloc/ingredient_blocs.dart';
import 'package:mitane_frontend/application/machinery/bloc/machinery_blocs.dart';
import 'package:mitane_frontend/application/store/bloc/store_bloc.dart';
import 'package:mitane_frontend/application/store/events/store_events.dart';
import 'package:mitane_frontend/application/user/bloc/user_blocs.dart';
import 'package:mitane_frontend/infrastructure/ingredient/data_provider/ingredient_provider.dart';
import 'package:mitane_frontend/infrastructure/ingredient/repository/ingredient_repository.dart';
import 'package:mitane_frontend/infrastructure/machinery/data_provider/machinery_provider.dart';
import 'package:mitane_frontend/infrastructure/machinery/repository/machinery_repository.dart';
import 'package:mitane_frontend/infrastructure/store/data_provider/store_provider.dart';
import 'package:mitane_frontend/infrastructure/store/repository/store_repository.dart';
import 'package:mitane_frontend/infrastructure/user/data_provider/user_provider.dart';
import 'package:mitane_frontend/infrastructure/user/repository/user_repository.dart';
import 'package:mitane_frontend/application/price/bloc/price_bloc.dart';
import 'package:mitane_frontend/application/product/bloc/product_bloc.dart';
import 'package:mitane_frontend/application/auth/bloc/auth_bloc.dart';
import 'package:mitane_frontend/application/price/events/price_event.dart';
import 'package:mitane_frontend/application/product/events/product_events.dart';
import 'package:mitane_frontend/application/suggestion/bloc/suggestion_bloc.dart';
import 'package:mitane_frontend/application/suggestion/events/suggestion_events.dart';
import 'package:mitane_frontend/infrastructure/auth/repository/auth_repository.dart';
import 'package:mitane_frontend/infrastructure/price/repository/price_repository.dart';
import 'package:mitane_frontend/infrastructure/product/repository/product_repository.dart';
import 'package:mitane_frontend/infrastructure/suggestion/data_provider/suggestion_provider.dart';
import 'package:mitane_frontend/infrastructure/suggestion/repository/suggestion_repository.dart';
import 'package:mitane_frontend/presentation/pages/Data_encoder/app_widget.dart';
import 'package:mitane_frontend/presentation/pages/admin/screens/Admin_Home.dart';
import 'package:mitane_frontend/presentation/pages/common/welcome.dart';
import 'package:mitane_frontend/presentation/pages/farmer/app_widget.dart';
import 'package:mitane_frontend/presentation/pages/user/app_widget.dart';
import 'package:mitane_frontend/route_generator.dart';

import 'infrastructure/auth/data_provider/auth_provider.dart';
import 'infrastructure/product/data_provider/product_provider.dart';

void main() => runApp(MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (context) =>
                AuthRepository(authDataProvider: AuthDataProvider(dio: Dio()))),
        RepositoryProvider(
            create: (context) =>
                UserRepository(dataProvider: UserDataProvider(dio: Dio()))),
        RepositoryProvider(
            create: (context) => MachineryRepository(
                dataProvider: MachineryDataProvider(dio: Dio()))),
        RepositoryProvider(
            create: (context) => IngredientRepository(
                dataProvider: IngredientDataProvider(dio: Dio()))),
        RepositoryProvider(create: (context) => PriceRepository()),
        RepositoryProvider(
            create: (context) => ProductRepository(
                dataProvider: ProductDataProvider(dio: Dio()))),
        RepositoryProvider(
            create: (context) => SuggestionRepository(
                suggestionProvider: SuggestionProvider(dio: Dio()))),
        RepositoryProvider(create: (context)=>StoreRepository(storeProvider: StoreProvider(dio: Dio())))
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  AuthBloc(authRepository: context.read<AuthRepository>())),
          BlocProvider(
              create: (context) =>
                  UserBloc(userRepository: context.read<UserRepository>())
                    ..add(UserAdminLoad())),
          BlocProvider(
              create: (context) => MachineryBloc(
                  machineryRepository: context.read<MachineryRepository>())
                ..add(MachineryAdminLoad())),
          BlocProvider(
              create: (context) => IngredientBloc(
                  ingredientRepository: context.read<IngredientRepository>())
                ..add(IngredientAdminLoad())),
          BlocProvider(create: (context) => PriceBloc()..add(PriceFetch())),
          BlocProvider(
              create: (context) => ProductBloc(
                  productRepository: context.read<ProductRepository>())
                ..add(ProductAdminLoad())),
          BlocProvider(
              create: (context) => SuggestionBloc(
                  suggestionRepository: context.read<SuggestionRepository>())
                ..add(FetchSuggestion())),
          BlocProvider(
              create: (context) => LoginStatusBloc()..add(CheckStatus())),
          BlocProvider(create: (context)=>StoreBloc(storeRepository: context.read<StoreRepository>())..add(FetchStore())),
        ],
        child: Mitane(),
      ),
    ));

class Mitane extends StatefulWidget {
  const Mitane({ Key? key }) : super(key: key);

  @override
  _MitaneState createState() => _MitaneState();
}

class _MitaneState extends State<Mitane> {
  dynamic userData = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          home: BlocBuilder<LoginStatusBloc, StatusState>(
            builder: (context, state) {
              print(state);
              if (state is LoggedInState) {
                final userData = state.userData;
                switch (userData['role']) {
                  case 'user':
                    return UserHome();
                  case 'farmer':
                    return FarmerHome();
                  case 'admin':
                    return AdminHome();
                  case 'data_encoder':
                    return EncoderHome();
                }
              }
              if (state is LoggedOutState) {
                return WelcomePage();
              }
              return Scaffold(body: Center(child: SizedBox(width: 15,height: 15,child: CircularProgressIndicator(),),),);
            },
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.generateRoute,
        );
  }
}