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
import 'package:ScrumBooster/scrumPhaseList/ProductBacklog.dart';

void main() {
  final HomePage home = HomePage();
  final ProductBacklog productBacklog = ProductBacklog();
  // final scaffoldKey = GlobalKey<ScaffoldState>();
  final SplashScreen splash = SplashScreen();

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

  test('AssetImage Product backlog from package', () {
    const AssetImage image = AssetImage(
      'assets/homepage/Product_Backlog.png',
      package: 'test_package',
    );
    expect(image.keyName, 'packages/test_package/assets/homepage/Product_Backlog.png');
  });

  test('AssetImage sprint planning from package', () {
    const AssetImage image = AssetImage(
      'assets/homepage/Sprint_Planning.png',
      package: 'test_package',
    );
    expect(image.keyName, 'packages/test_package/assets/homepage/Sprint_Planning.png');
  });

  test('AssetImage sprint exe from package', () {
    const AssetImage image = AssetImage(
      'assets/homepage/Sprint_Exe.png',
      package: 'test_package',
    );
    expect(image.keyName, 'packages/test_package/assets/homepage/Sprint_Exe.png');
  });

  test('AssetImage sprint evaluation from package', () {
    const AssetImage image = AssetImage(
      'assets/homepage/Sprint_Evaluation.png',
      package: 'test_package',
    );
    expect(image.keyName, 'packages/test_package/assets/homepage/Sprint_Evaluation.png');
  });

  testWidgets('Test Find Header', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(makeTestableWidget(child: home));
    String menu1 = "WHICH SCRUMPHASE ARE YOU IN RIGHT NOW?";
    // Verify all the sidebar menu.
    expect(find.text(menu1), findsOneWidget);
  });

  testWidgets('Test Find Wrong Header', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(makeTestableWidget(child: home));
    String menu1 = "WHICH SCRUM BOOSTER ARE YOU IN RIGHT NOW?";
    // Verify all the sidebar menu.
    expect(find.text(menu1), findsNothing);
  });

  testWidgets('Test Find Product Header 1', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(makeTestableWidget(child: productBacklog));
    String menu1 = "Things you should be doing:";
    // Verify all the sidebar menu.
    expect(find.text(menu1), findsOneWidget);
  });

  testWidgets('Test Not Find Product Header 1', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(makeTestableWidget(child: productBacklog));
    String menu1 = "Things you shouldn't be doing:";
    // Verify all the sidebar menu.
    expect(find.text(menu1), findsNothing);
  });

  testWidgets('Test Find Product Header 2', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(makeTestableWidget(child: productBacklog));
    String menu1 = "Problems you might have face:";
    // Verify all the sidebar menu.
    expect(find.text(menu1), findsOneWidget);
  });

  testWidgets('Test Not Find Product Header 2', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(makeTestableWidget(child: productBacklog));
    String menu1 = "Problems you might have not face:";
    // Verify all the sidebar menu.
    expect(find.text(menu1), findsNothing);
  });

  testWidgets('Test Find 6 Number of Contents', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(makeTestableWidget(child: productBacklog));
    String menu1 = "content";
    // Verify all the sidebar menu.
    expect(find.byWidgetPredicate((widget) {
      if (widget is Text) {
        final Text textWidget = widget;
        if (textWidget.data != null)
          return textWidget.data.contains(menu1);
        return textWidget.textSpan.toPlainText().contains(menu1);
      }
      return false;
    }), findsNWidgets(6));
  });

  testWidgets('Test Find 3 Number of Problems Before Scrolled', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(makeTestableWidget(child: productBacklog));
    String menu1 = "problem";
    // Verify all the sidebar menu.
    expect(find.byWidgetPredicate((widget) {
      if (widget is Text) {
        final Text textWidget = widget;
        if (textWidget.data != null)
          return textWidget.data.contains(menu1);
        return textWidget.textSpan.toPlainText().contains(menu1);
      }
      return false;
    }), findsNWidgets(3));
  });
}