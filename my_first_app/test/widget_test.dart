// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:my_first_app/main.dart';

void main() {
  testWidgets('menu is available only after login', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const RestaurantApp());

    expect(find.text('Log in'), findsOneWidget);
    expect(find.text('Burgers').hitTestable(), findsNothing);

    await tester.enterText(
      find.byType(TextFormField).at(0),
      'diner@example.com',
    );
    await tester.enterText(find.byType(TextFormField).at(1), 'password');
    await tester.tap(find.text('Log in'));
    await tester.pumpAndSettle();

    expect(find.text('Burgers'), findsWidgets);

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Log out'));
    await tester.pumpAndSettle();

    expect(find.text('Log in'), findsOneWidget);
    expect(find.text('Burgers').hitTestable(), findsNothing);
  });
}
