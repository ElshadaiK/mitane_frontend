import 'package:flutter/material.dart';
import 'package:mitane_frontend/presentation/pages/sign_in/Password_reset.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0x8CC63E).withOpacity(0.45),
        child: Stack(
          children: [
            Positioned(
              child: Align(
                child: Text(
                  'It is okay!Reset your Password',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              top: 250,
              left: MediaQuery.of(context).size.width * 0.13,
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
                        hintText: 'Phone Number'),
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
                      MaterialPageRoute(builder: (context) => PasswordRest()),
                    );
                  }, // handle your onTap here
                  child: Container(
                    height: 46,
                    width: MediaQuery.of(context).size.width * 0.76,
                    child: Align(
                        child: Text(
                      'Continue',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold),
                    )),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        color: Colors.white),
                  )),
              top: 450,
              left: MediaQuery.of(context).size.width * 0.1,
            ),
          ],
        ),
      ),
    );
  }
}
