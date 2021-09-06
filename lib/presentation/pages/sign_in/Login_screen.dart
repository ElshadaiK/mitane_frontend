import 'package:flutter/material.dart';
import 'package:mitane_frontend/presentation/pages/farmer/home_page.dart';
import 'package:mitane_frontend/presentation/pages/sign_in/Forgot_password.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0x8CC63E).withOpacity(0.45),
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.76,
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(5),
                  child: TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Phone Number'),
                  ),
                ),
              ),
              top: 250,
              left: MediaQuery.of(context).size.width * 0.1,
            ),
            Positioned(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.76,
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(5),
                  child: TextField(
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
              top: 350,
              left: MediaQuery.of(context).size.width * 0.1,
            ),
            Positioned(
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  }, // handle your onTap here
                  child: Container(
                    height: 46,
                    width: MediaQuery.of(context).size.width * 0.76,
                    child: Align(
                        child: Text(
                      'Log In',
                      style: TextStyle(
                          color: Color(0x8CC63E).withOpacity(1),
                          fontWeight: FontWeight.bold),
                    )),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        color: Colors.white),
                  )),
              top: 450,
              left: MediaQuery.of(context).size.width * 0.1,
            ),
            Positioned(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgotPassword()),
                  );
                },
                child: Align(
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              top: 520,
              left: MediaQuery.of(context).size.width * 0.34,
            )
          ],
        ),
      ),
    );
  }
}
