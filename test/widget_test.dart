// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:scrum_booster/main.dart';

void main() {
  testWidgets('Find sidebar widget', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final scaffoldKey = GlobalKey<ScaffoldState>();
    const menu1 = "Home";
    const menu2 = "Ceremonies";
    const menu3 = "Problems";
    const menu4 = "Glossary";
    const menu5 = "Pop Quiz!";
    const menu6 = "About";
    await tester.pumpWidget(MyApp());

    // Tap the 'burger menu' icon and trigger a frame.
    scaffoldKey.currentState.openDrawer();
    await tester.pump();

    // Verify all the sidebar menu.
    expect(find.text(menu1), findsOneWidget);
    expect(find.text(menu2), findsOneWidget);
    expect(find.text(menu3), findsOneWidget);
    expect(find.text(menu4), findsOneWidget);
    expect(find.text(menu5), findsOneWidget);
    expect(find.text(menu6), findsOneWidget);
  });

  testWidgets('Find scrum phase', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    const menu1 = "Product Backlog";
    await tester.pumpWidget(MyApp());


    // Verify all the sidebar menu.
    expect(find.text(menu1), findsOneWidget);
  })
  ;}
