import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitane_frontend/application/auth/bloc/auth_bloc.dart';
import 'package:mitane_frontend/application/auth/events/auth_events.dart';
import 'package:mitane_frontend/application/auth/states/auth_state.dart';
import 'package:mitane_frontend/domain/auth/entity/auth_model.dart';
import 'package:mitane_frontend/presentation/pages/auth/Forgot_password.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);
  static const routeName = '/li';

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final phoneTextFieldController = TextEditingController();

  final passwordTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Color(0x8CC63E).withOpacity(0.45),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.76,
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(5),
                child: TextField(
                  controller: phoneTextFieldController,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'phone number'),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.76,
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(5),
                child: TextField(
                  controller: passwordTextFieldController,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Password'),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            BlocConsumer<AuthBloc, AuthState>(
              builder: (context, state) {
                print(state);
                Widget button = Text(
                  'Log In',
                  style: TextStyle(
                      color: Color(0x8CC63E).withOpacity(1),
                      fontWeight: FontWeight.bold),
                );
                if (state is LoggingIn) {
                  button = Center(
                      child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(),
                  ));
                }

                return InkWell(
                    onTap: () {
                      final authBloc = context.read<AuthBloc>();
                      authBloc.add((LoginEvent(
                          login: Login(
                              phone: phoneTextFieldController.text,
                              password: passwordTextFieldController.text))));
                    },
                    child: Container(
                      height: 46,
                      width: MediaQuery.of(context).size.width * 0.76,
                      child: Align(child: button),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          color: Colors.white),
                    ));
              },
              listener: (context, state) {
                if (state is LoginSuccess) {
                  final role = state.user.roles[0];
                  print(role);
                  if(role == 'user')
                    Navigator.pushNamed(context, '/');
                  else if(role == 'farmer')
                    Navigator.pushNamed(context, '/farmer');
                  else if(role == 'encoder')
                    Navigator.pushNamed(context, '/encoder');
                  else
                    Navigator.pushNamed(context, '/admin');
                }
              },
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text(
                  "You don't have an account? register here.",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}
