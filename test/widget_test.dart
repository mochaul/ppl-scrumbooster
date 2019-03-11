// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ScrumBooster/main.dart';
import 'package:ScrumBooster/initScreen/HomeScreen.dart';
import 'package:ScrumBooster/initScreen/splashScreen.dart';
import 'package:ScrumBooster/contentsList/GlossaryPage.dart';

void main() {
  final HomePage home = HomePage();
  // final scaffoldKey = GlobalKey<ScaffoldState>();
  final SplashScreen splash = SplashScreen();
  final GlossaryPage glossary =GlossaryPage();

  Widget makeTestableWidget({Widget child}) {
    return MaterialApp(
      home: child,
      // key: scaffoldKey,
    );
  }

  testWidgets('Home Screen Drawer Test', (WidgetTester tester) async {
    GlobalKey<ScaffoldState> scaffoldKey = home.getScaffoldKey();
    await tester.pumpWidget(makeTestableWidget(child: home));

    const menu1 = "Home";
    const menu2 = "Ceremonies";
    const menu3 = "Problems";
    const menu4 = "Glossary";
    const menu5 = "Pop Quiz!";
    const menu6 = "About";

    // Tap the 'burger menu' icon and trigger a frame.
    scaffoldKey.currentState.openDrawer();
    print("berhasil yey");
    await tester.pump();

    // Verify all the sidebar menu.
    expect(find.text(menu1), findsOneWidget);
    expect(find.text(menu2), findsOneWidget);
    expect(find.text(menu3), findsOneWidget);
    expect(find.text(menu4), findsOneWidget);
    expect(find.text(menu5), findsOneWidget);
    expect(find.text(menu6), findsOneWidget);
  });

  testWidgets('Test Find Scrum Phase', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    const menu1 = "Product Backlog";
    await tester.pumpWidget(makeTestableWidget(child: home));

    // Verify all the sidebar menu.
    expect(find.text(menu1), findsOneWidget);
  });

  test('AssetImage from package', () {
      const AssetImage logo = AssetImage(
        'assets/logos/logo-color.png',
        package: 'test_package',
      );
       const AssetImage makara = AssetImage(
        'assets/logos/Makara-UI.png',
        package: 'test_package',
      );
       const AssetImage glossary = AssetImage(
        'assets/listGlossary/glossary.png',
        package: 'test_package',
      );
      expect(logo.keyName, 'packages/test_package/assets/logos/logo-color.png');
      expect(makara.keyName, 'packages/test_package/assets/logos/Makara-UI.png');
      expect(glossary.keyName, 'packages/test_package/assets/listGlossary/glossary.png');
    });

  testWidgets('Test Find List Glossary', (WidgetTester tester) async {
  // Build our app and trigger a frame.
  await tester.pumpWidget(makeTestableWidget(child: glossary));
  String header1 = "GLOSSARY";
  // Verify all the sidebar menu.
  expect(find.text(header1), findsOneWidget);
  });


 
}
