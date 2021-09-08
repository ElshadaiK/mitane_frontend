import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitane_frontend/application/bloc/price_bloc.dart';
import 'package:mitane_frontend/application/bloc/user_bloc.dart';
import 'package:mitane_frontend/application/events/price_event.dart';
import 'package:mitane_frontend/infrastructure/repository/auth_repository.dart';
import 'package:mitane_frontend/infrastructure/repository/price_repository.dart';
import 'package:mitane_frontend/route_generator.dart';

import 'infrastructure/data_provider/auth_provider.dart';

void main() => runApp(MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (context) =>
                AuthRepository(authDataProvider: AuthDataProvider(dio: Dio()))),
        RepositoryProvider(create: (context) => PriceRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  AuthBloc(authRepository: context.read<AuthRepository>())),
          BlocProvider(create: (context) => PriceBloc()..add(PriceFetch()))
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/splash',
          onGenerateRoute: RouteGenerator.generateRoute,
        ),
      ),
    ));
