import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mitane_frontend/presentation/pages/common/SlideEditAndDelete.dart';
import 'package:mitane_frontend/presentation/pages/farmer/store_screen.dart';


void main() {
  testWidgets('MyWidget has a main scaffold', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: StoreDisplay(items: [],),));
    final titleFinder = find.byType(Container);
    expect(titleFinder, findsOneWidget);
  });
  
}