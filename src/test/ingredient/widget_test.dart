import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mitane_frontend/presentation/pages/agri_inputs/screens/ingredient_page.dart';

void main() {
  testWidgets('It has an appbar', (WidgetTester tester) async {
   
    final childWidget = AppBar(
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.black));
    await tester.pumpWidget(Scaffold(appBar: childWidget));
    expect(find.byWidget(childWidget), findsOneWidget);
  });
}
