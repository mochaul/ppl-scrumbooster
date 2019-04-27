import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ScrumBooster/Utils/utils.dart';

import 'package:ScrumBooster/InitialScreen/HomeScreen.dart';

void main() {
  final HomePage home = HomePage();
  final util = new Util();

  //Home Page Widget Tests
  testWidgets('Home Screen Drawer Test', (WidgetTester tester) async {
    GlobalKey<ScaffoldState> scaffoldKey = home.getScaffoldKey();
    await tester.pumpWidget(util.makeTestableWidget(child: home));
    Key menu1 = new Key("Home");
    Key menu2 = new Key("Ceremonies");
    Key menu3 = new Key("Problems");
    Key menu4 = new Key("Glossary");
    Key menu5 = new Key("Pop Quiz!");
    Key menu6 = new Key("About");

    scaffoldKey.currentState.openDrawer();
    await tester.pump();

    expect(find.byKey(menu1), findsOneWidget);
    expect(find.byKey(menu2), findsOneWidget);
    expect(find.byKey(menu3), findsOneWidget);
    expect(find.byKey(menu4), findsOneWidget);
    expect(find.byKey(menu5), findsOneWidget);
    expect(find.byKey(menu6), findsOneWidget);
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
