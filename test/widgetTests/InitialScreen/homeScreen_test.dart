import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ScrumBooster/Utils/utils.dart';

import 'package:ScrumBooster/InitialScreen/HomeScreen.dart';

void main() {
  final HomePage home = HomePage();
  final util = new Util();

  //Home Page Widget Tests
  testWidgets('Drawer Test', (WidgetTester tester) async {
    GlobalKey<ScaffoldState> scaffoldKey = home.getScaffoldKey();
    await tester.pumpWidget(
        util.makeTestableWidget(child: home)
    );
    await tester.pump();

    List<String> keys = [
      'Home',
      'Ceremonies',
      'Problems',
      'Glossary',
      'About',
    ];

    scaffoldKey.currentState.openDrawer();
    await tester.pump();

    for (int i = 0; i < keys.length; i++) {
      Key key = new Key(keys[i]);
      expect(find.byKey(key), findsOneWidget);
    }
  });

  testWidgets('Test Find Header', (WidgetTester tester) async {
    await tester.pumpWidget(util.makeTestableWidget(child: home));
    String menu1 = "WHICH SCRUM PHASE ARE YOU IN RIGHT NOW?";
    expect(find.text(menu1), findsOneWidget);
  });

  testWidgets('Test Find Wrong Header', (WidgetTester tester) async {
    await tester.pumpWidget(util.makeTestableWidget(child: home));
    String menu1 = "WHICH SCRUM BOOSTER ARE YOU IN RIGHT NOW?";
    expect(find.text(menu1), findsNothing);
  });
}
