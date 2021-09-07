import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitane_frontend/application/bloc/user_bloc.dart';
import 'package:mitane_frontend/infrastructure/repository/auth_repository.dart';
import 'package:mitane_frontend/route_generator.dart';


import 'package:http/http.dart' as http;

import 'infrastructure/data_provider/auth_provider.dart';

void main() => runApp(MultiRepositoryProvider(
  providers: [RepositoryProvider(create: (ctx)=>AuthRepository(
          authDataProvider: AuthDataProvider(httpClient: http.Client())))],
  child:   MultiBlocProvider(
    providers: [BlocProvider(create: (ctx)=>AuthBloc(authRepository: ctx.read<AuthRepository>()))],
    child:   MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/Login',
      onGenerateRoute: RouteGenerator.generateRoute,
    ),
  ),
));
 
