import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:mitane_frontend/route_generator.dart';

import 'infrastructure/auth/data_provider/auth_provider.dart';
import 'infrastructure/product/data_provider/product_provider.dart';

void main() => runApp(MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (context) =>
                AuthRepository(authDataProvider: AuthDataProvider(dio: Dio()))),
        RepositoryProvider(create: (context) => PriceRepository()),
        RepositoryProvider(create:(context)=>ProductRepository(productProvider:ProductProvider(dio:Dio()))),
        RepositoryProvider(create: (context)=>SuggestionRepository(suggestionProvider: SuggestionProvider(dio: Dio())))
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  AuthBloc(authRepository: context.read<AuthRepository>())),
          BlocProvider(create: (context) => PriceBloc()..add(PriceFetch())),
          BlocProvider(create:(context)=> ProductBloc(productRepository:context.read<ProductRepository>())..add(ProductFetch())),
          BlocProvider(create: (context)=>SuggestionBloc(suggestionRepository: context.read<SuggestionRepository>())..add(FetchSuggestion())),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/splash',
          onGenerateRoute: RouteGenerator.generateRoute,
        ),
      ),
    ));
