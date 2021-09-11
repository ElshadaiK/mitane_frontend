import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mitane_frontend/presentation/pages/agri_inputs/screens/ingredient_page.dart';

void main() {
  testWidgets('It has an appbar', (WidgetTester tester) async {
    await tester.pumpWidget(IngredientScreen());
    final childWidget = Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue,
            iconTheme: IconThemeData(color: Colors.black)));

    expect(find.byWidget(childWidget), findsOneWidget);
  });

  testWidgets('Ingredient page contains 1 input fields',
      (WidgetTester tester) async {
    await tester.pumpWidget(IngredientScreen());
    final inputFieldsCount = find.byType(TextField);
    expect(inputFieldsCount, findsOneWidget);
  });

  testWidgets('Ingredients page is visibile', (WidgetTester tester) async {
    await tester.pumpWidget(IngredientScreen());
    final infoFinder = find.text("Fertilizer");

    expect(infoFinder, findsOneWidget);
  });
}
