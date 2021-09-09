import 'dart:js';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitane_frontend/Admin/blocs/UserAdmin_Bloc.dart';
import 'package:mitane_frontend/Admin/blocs/UserAdmin_Blocs.dart';
import 'package:mitane_frontend/Admin/data-providers/UserAdmin_Data-Provider.dart';
import 'package:mitane_frontend/Admin/repository/UserAdmin_Repository.dart';
import 'package:mitane_frontend/application/price/bloc/price_bloc.dart';
import 'package:mitane_frontend/application/product/bloc/product_bloc.dart';
import 'package:mitane_frontend/application/auth/bloc/auth_bloc.dart';
import 'package:mitane_frontend/application/price/events/price_event.dart';
import 'package:mitane_frontend/application/product/events/product_events.dart';
import 'package:mitane_frontend/infrastructure/auth/repository/auth_repository.dart';
import 'package:mitane_frontend/infrastructure/core/data_provider.dart';
import 'package:mitane_frontend/infrastructure/price/repository/price_repository.dart';
import 'package:mitane_frontend/infrastructure/product/repository/product_repository.dart';
import 'package:mitane_frontend/route_generator.dart';

import 'infrastructure/auth/data_provider/auth_provider.dart';
import 'infrastructure/product/data_provider/product_provider.dart';

void main() => runApp(MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (context) =>
                AuthRepository(authDataProvider: AuthDataProvider(dio: Dio()))),
        RepositoryProvider(create: (context) => UserAdminRepository(dataProvider: UserAdminDataProvider())),
        RepositoryProvider(create: (context) => PriceRepository()),
        RepositoryProvider(create:(context)=>ProductRepository(productProvider:ProductProvider(dio:Dio()))),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  AuthBloc(authRepository: context.read<AuthRepository>())),
          BlocProvider(create: (context) => UserAdminBloc(userAdminRepository: context.read<UserAdminRepository>())..add(UserAdminLoad())),
          BlocProvider(create: (context) => PriceBloc()..add(PriceFetch())),
          BlocProvider(create:(context)=> ProductBloc(productRepository:context.read<ProductRepository>())..add(ProductFetch())),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/admin/users',
          onGenerateRoute: RouteGenerator.generateRoute,
        ),
      ),
    ));

