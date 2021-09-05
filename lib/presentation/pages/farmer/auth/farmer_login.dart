import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitane_frontend/application/bloc/user_bloc.dart';
import 'package:mitane_frontend/application/events/auth_events.dart';
import 'package:mitane_frontend/application/states/auth_state.dart';
import 'package:mitane_frontend/domain/entity/user_model.dart';
import 'package:mitane_frontend/presentation/pages/farmer/home_page.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  LoginScreen({Key? key}) : super(key: key);

  final phoneTextfieldController = TextEditingController();
  final passwrodTextfieldController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final inputFieldStyle = InputDecoration(
      border: OutlineInputBorder(),
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: phoneTextfieldController,
                  decoration: inputFieldStyle.copyWith(hintText: "phone"),
                ),
                TextFormField(
                  controller: passwrodTextfieldController,
                  decoration: inputFieldStyle.copyWith(
                    hintText: "password",
                  ),
                ),
                BlocConsumer<AuthBloc, AuthState>(
                    builder: (context, authState) {
                      Widget buttonChild = Text("Login");
                      if (authState is LoggedIn) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      }

                      if (authState is LoggingIn) {
                        buttonChild = CircularProgressIndicator(
                          color: Colors.white,
                        );
                      }
                      if (authState is LoggingError) {
                        buttonChild = Text("error");
                      }
                      return ElevatedButton(
                        onPressed: () {
                          final authBloc = context.read<AuthBloc>();
                          print("pressed");
                          authBloc.add(LogginEvent(
                              login: Login(
                                  phone: phoneTextfieldController.text,
                                  password: passwrodTextfieldController.text)));
                        },
                        child: buttonChild,
                      );
                    },
                    listener: (ctx, authState) {}),
              ],
            )),
      ),
    );
  }
}
