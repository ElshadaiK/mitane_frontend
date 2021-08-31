import 'package:flutter/material.dart';
import 'package:mitane_frontend/presentation/animation/FadeAnimation.dart';
import 'package:mitane_frontend/presentation/pages/farmer/auth/signup/farmer_sign_up_page.dart';
import 'package:mitane_frontend/presentation/pages/user/auth/signup/user_sign_up_page.dart';
import 'package:mitane_frontend/presentation/pages/common/mitaneButton.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeAnimation(
                    1,
                    Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontFamily: 'Oxygen',
                          fontSize: 28,
                          color: const Color(0xff222222),
                          letterSpacing: 0.812,
                          height: 1.0714285714285714,
                        ),
                        children: [
                          TextSpan(
                            text: 'Welcome to',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: TextStyle(
                              color: const Color(0xff00b7f1),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: 'Mitane',
                            style: TextStyle(
                              color: Colors.green[400],
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  FadeAnimation(
                    1.2,
                    Text(
                      'Your Only Agricultural Solution',
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 12,
                        color: const Color(0xff222222),
                        letterSpacing: 0.5760000000000001,
                        fontWeight: FontWeight.w300,
                        height: 2.5,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              FadeAnimation(
                  1.4,
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/welcom_screen_image.png'))),
                  )),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 35,
                  ),
                  Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 13,
                        color: const Color(0xff222222),
                        height: 1.5384615384615385,
                      ),
                      children: [
                        TextSpan(
                          text: 'Read our ',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        TextSpan(
                          text: 'privacy policy',
                          style: TextStyle(
                            color: Colors.green[200],
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        TextSpan(
                          text:
                              '. Tap \'Accept and Continue\' to\n accept the ',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        TextSpan(
                          text: 'Terms and Services',
                          style: TextStyle(
                            color: Colors.green[200],
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        TextSpan(
                          text: '.',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  FadeAnimation(
                    1.5,
                    MitaneButton(
                      paddingHorizontal: 50,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => UserSignUp()));
                      },
                      title: 'Accept and Continue',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                      1.6,
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => FarmerSignUp())),
                        child: Container(
                          padding: EdgeInsets.only(top: 3, left: 3),
                          child: Text.rich(
                            TextSpan(
                              style: TextStyle(
                                fontFamily: 'Ubuntu',
                                fontSize: 15,
                                color: const Color(0xff222222),
                              ),
                              children: [
                                TextSpan(
                                  text: 'Are you a ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Farmer/Trader',
                                  style: TextStyle(
                                    color: Colors.green[200],
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                TextSpan(
                                  text: '?',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
