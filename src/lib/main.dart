import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitane_frontend/application/bloc/user_bloc.dart';
import 'package:mitane_frontend/infrastructure/repository/auth_repository.dart';
import 'package:mitane_frontend/route_generator.dart';

import 'infrastructure/data_provider/auth_provider.dart';

void main() => runApp(MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (ctx) => AuthRepository(
                authDataProvider: AuthDataProvider(dio: Dio())))
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (ctx) =>
                  AuthBloc(authRepository: ctx.read<AuthRepository>()))
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          onGenerateRoute: RouteGenerator.generateRoute,
        ),
      ),
    ));
