import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mitane_frontend/presentation/pages/suggestions/suggestions_display.dart';

void main() {
  testWidgets('MyWidget has a main scaffold', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SuggestionsDisplay(),));
    final titleFinder = find.byType(Scaffold);
    expect(titleFinder, findsOneWidget);
  });
  
}