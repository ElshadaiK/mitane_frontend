import 'package:flutter/material.dart';

class PasswordRest extends StatefulWidget {
  const PasswordRest({ Key? key }) : super(key: key);

  @override
  _PasswordRestState createState() => _PasswordRestState();
}

class _PasswordRestState extends State<PasswordRest> {
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
                  'We have sent you a code to \n    Reset your password',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              top: 250,
              left: MediaQuery.of(context).size.width * 0.15,
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
                        hintText: 'Confirmation Code'),
                  ),
                ),
              ),
              top: 340,
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
                        hintText: 'New Password'),
                  ),
                ),
              ),
              top: 400,
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
                        hintText: 'Confirm Password'),
                  ),
                ),
              ),
              top: 460,
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
                      'Reset Password',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold),
                    )),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        color: Colors.white),
                  )),
              top: 550,
              left: MediaQuery.of(context).size.width * 0.1,
            ),
          ],
        ),
      ),
    );
  }
}