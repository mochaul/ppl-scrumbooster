// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ScrumBooster/initScreen/HomeScreen.dart';
import 'package:ScrumBooster/initScreen/splashScreen.dart';
import 'package:ScrumBooster/contents/problems.dart';

void main() {
  final HomePage home = HomePage();
  final SplashScreen splash = SplashScreen();
  final ProblemsContentPage _problemsContentPage = ProblemsContentPage(
    title: "Lorem Ipsum",
    imagePath: "assets/logos/logo-color.png",
    contents: "Lorem ipsum dolor sit amet.",
  );

  Widget makeTestableWidget({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('Home Screen Drawer Test', (WidgetTester tester) async {
    GlobalKey<ScaffoldState> scaffoldKey = home.getScaffoldKey();
    await tester.pumpWidget(makeTestableWidget(child: home));
    Key menu1 = new Key("Home");
    Key menu2 = new Key("Ceremonies");
    Key menu3 = new Key("Problems");
    Key menu4 = new Key("Glossary");
    Key menu5 = new Key("Pop Quiz!");
    Key menu6 = new Key("About");

    // Tap the 'burger menu' icon and trigger a frame.
    scaffoldKey.currentState.openDrawer();
    await tester.pump();

    // Verify all the sidebar menu.
    expect(find.byKey(menu1), findsOneWidget);
    expect(find.byKey(menu2), findsOneWidget);
    expect(find.byKey(menu3), findsOneWidget);
    expect(find.byKey(menu4), findsOneWidget);
    expect(find.byKey(menu5), findsOneWidget);
    expect(find.byKey(menu6), findsOneWidget);
  });

  testWidgets('Test Find Scrum Phase', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    const menu1 = "Product Backlog";
    await tester.pumpWidget(makeTestableWidget(child: home));

    // Verify all the sidebar menu.
    expect(find.text(menu1), findsOneWidget);
  });

  testWidgets('Test Problems Content Page', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: _problemsContentPage));

    Key mainStack = new Key("Main Stack");
    Key problemsContentImage = new Key("Problems Content Image");
    Key problemsContent = new Key("Problems Content");
    Key problemsTitleContainer = new Key("Problems Title Container");
    Key problemsTitleStack = new Key("Problems Title Stack");
    Key problemsTitle = new Key("Problems Title");
    Key problemsContentContainer = new Key("Problems Content Container");
    Key problemsContentText = new Key("Problems Content Text");

    expect(find.byKey(mainStack), findsOneWidget);
    expect(find.byKey(problemsContentImage), findsOneWidget);
    expect(find.byKey(problemsContent), findsOneWidget);
    expect(find.byKey(problemsTitleContainer), findsNWidgets(2));
    expect(find.byKey(problemsTitleStack), findsOneWidget);
    expect(find.byKey(problemsTitle), findsOneWidget);
    expect(find.byKey(problemsContentContainer), findsOneWidget);
    expect(find.byKey(problemsContentText), findsOneWidget);
  });
}