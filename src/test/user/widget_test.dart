import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mitane_frontend/presentation/pages/common/with_search_bar.dart';
import 'package:mitane_frontend/presentation/pages/user/app_widget.dart';
import 'package:mitane_frontend/presentation/pages/user/home_page.dart';

void main() {
  testWidgets('MyWidget has a bottom nav', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: UserHome(),));
    final titleFinder = find.byType(BottomNavigationBar);
    expect(titleFinder, findsOneWidget);
  });
  
}