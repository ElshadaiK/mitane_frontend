import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mitane_frontend/presentation/pages/machinery/screens/machinery_screen.dart';

void main() {
  testWidgets('Machinery page contains 1 input fields',
      (WidgetTester tester) async {
    await tester.pumpWidget(MachineryScreen());
    final inputFieldsCount = find.byType(TextField);
    expect(inputFieldsCount, findsOneWidget);
  });
}
