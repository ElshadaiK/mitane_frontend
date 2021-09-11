import 'package:mitane_frontend/presentation/pages/user/auth/signup/user_sign_up_page.dart';
import 'package:mitane_frontend/presentation/pages/auth/sign_up_page.dart';
import 'package:mitane_frontend/presentation/pages/auth/Login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('User Sign up page contains two input fields',
      (WidgetTester tester) async {
    await tester.pumpWidget(UserSignUp());
    final inputFieldsCount = find.byType(TextField);
    expect(inputFieldsCount, findsNWidgets(2));
  });

  testWidgets('User sign up screen is visible', (WidgetTester tester) async {
    await tester.pumpWidget(UserSignUp());
    final verifyFinder = find.text('Verify your phone number');
    final confirmFinder = find.text(
      "Confirm the country code and Enter \n Your Phone number",
    );
    final nextFinder = find.text('Next');
    expect(verifyFinder, findsOneWidget);
    expect(confirmFinder, findsOneWidget);
    expect(nextFinder, findsOneWidget);
  });



testWidgets('Sign up page contains five input fields',
      (WidgetTester tester) async {
    await tester.pumpWidget(SignUp());
    final inputFieldsCount = find.byType(TextField);
    expect(inputFieldsCount, findsNWidgets(5));
  });

testWidgets('Sign up screen is visible', (WidgetTester tester) async {
    await tester.pumpWidget(SignUp());
    final infoFinder = find.text('Please fill your \ninformation');
    final registerFinder = find.text(
      "Register",
    );
    
    expect(infoFinder, findsOneWidget);
    expect(registerFinder, findsOneWidget);
    
  });


  testWidgets('Login screen is visible', (WidgetTester tester) async {
    await tester.pumpWidget(LogIn());
    final textFinder = find.text("You don't have an account? register here.");
    
    
    expect(textFinder, findsOneWidget);
    
    
  });


}
