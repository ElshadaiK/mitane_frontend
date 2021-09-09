import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitane_frontend/application/bloc/price_bloc.dart';
import 'package:mitane_frontend/application/bloc/product_bloc.dart';
import 'package:mitane_frontend/application/bloc/user_bloc.dart';
import 'package:mitane_frontend/application/events/price_event.dart';
import 'package:mitane_frontend/application/events/product_events.dart';
import 'package:mitane_frontend/infrastructure/repository/auth_repository.dart';
import 'package:mitane_frontend/infrastructure/repository/price_repository.dart';
import 'package:mitane_frontend/infrastructure/repository/product_repository.dart';
import 'package:mitane_frontend/route_generator.dart';

import 'infrastructure/data_provider/auth_provider.dart';
import 'infrastructure/data_provider/product_provider.dart';

void main() => runApp(MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (context) =>
                AuthRepository(authDataProvider: AuthDataProvider(dio: Dio()))),
        RepositoryProvider(create: (context) => PriceRepository()),
        RepositoryProvider(create:(context)=>ProductRepository(productProvider:ProductProvider(dio:Dio()))),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  AuthBloc(authRepository: context.read<AuthRepository>())),
          BlocProvider(create: (context) => PriceBloc()..add(PriceFetch())),
           BlocProvider(create:(context)=> ProductBloc(productRepository:context.read<ProductRepository>())..add(ProductFetch())),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/login',
          onGenerateRoute: RouteGenerator.generateRoute,
        ),
      ),
    ));
