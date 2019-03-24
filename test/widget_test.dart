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
import 'package:ScrumBooster/contents/ceremonies.dart';
import 'package:ScrumBooster/contents/problems.dart';
import 'package:ScrumBooster/contentsList/GlossaryPage.dart';
import 'package:ScrumBooster/contentsList/ListProblems.dart';
import 'package:ScrumBooster/contentsList/ListCeremonies.dart';
import 'package:ScrumBooster/scrumPhaseList/ProductBacklog.dart';
import 'package:ScrumBooster/initScreen/AboutPage.dart';

void main() {
  final HomePage home = HomePage();
  final SplashScreen splash = SplashScreen();
  final ProblemsContentPage _problemsContentPage = ProblemsContentPage(
    title: "Lorem Ipsum",
    imagePath: "assets/logos/logo-color.png",
    contents: "Lorem ipsum dolor sit amet.",
  );

  final Ceremonies ceremonies =  Ceremonies(
    title: "BACKLOG GROOMING",
    imagePath: "assets/logos/logo-color.png",
    contents: "testing",
  );
  // final scaffoldKey = GlobalKey<ScaffoldState>();

  final ProductBacklog productBacklog = ProductBacklog();
  final ListProblems lstProblems = ListProblems();
  final ListCeremonies lstCeremonies = ListCeremonies();
  final GlossaryPage glossary =GlossaryPage();
  final AboutPage about = AboutPage();

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
    String menu1 = "WHICH SCRUM PHASE ARE YOU IN RIGHT NOW?";
    // Verify all the sidebar menu.
    expect(find.text(menu1), findsOneWidget);
  });

  testWidgets('Test Find Title Ceremonies', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(makeTestableWidget(child: ceremonies));
    String title = "BACKLOG GROOMING";
    expect(find.text(title), findsOneWidget);
  });

  testWidgets('Test Find Content Ceremonies', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(makeTestableWidget(child: ceremonies));
    String content = "testing";
    expect(find.text(content), findsOneWidget);
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
  expect(find.text(header1), findsOneWidget);
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

  test('AssetImage from package', () {
    const AssetImage image = AssetImage(
      'assets/listProblems/problems.png',
      package: 'test_package',
    );
    expect(image.keyName, 'packages/test_package/assets/listProblems/problems.png');
  });

  testWidgets('Test Find List Problems', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(makeTestableWidget(child: lstProblems));
    String header1 = "PROBLEMS";
    // Verify all the sidebar menu.
    expect(find.text(header1), findsOneWidget);
  });

  test('AssetImage from package', () {
    const AssetImage image = AssetImage(
      'assets/listCeremonies/ceremonies.png',
      package: 'test_package',
    );
    expect(image.keyName, 'packages/test_package/assets/listCeremonies/ceremonies.png');
  });

  testWidgets('Test Find List Ceremonies', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: lstCeremonies));
    String header1 = "CEREMONIES";
    expect(find.text(header1), findsOneWidget);
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

  //About Page Widget Tests
  testWidgets('About Page: Find Logos', (WidgetTester tester) async {
    List<String> keys = <String>[
      "Scrum Booster Logo",
      "Makara UI Logo",
    ];

    await tester.pumpWidget(makeTestableWidget(child: about));
    for (int i = 0; i < keys.length; i++) {
      expect(find.byKey(new Key(keys[i])), findsOneWidget);
    }
  });

  testWidgets('About Page: Find Team Members Text', (WidgetTester tester) async {
    List<String> teamMembers = <String>[
      "Mochamad Aulia Akbar Praditomo",
      "Fajrin Maulana Kingwijati",
      "Izzan Fakhril Islam",
      "Muhammad Rezki",
      "Khoirul Khuluqi Abdulloh",
      "Wildan Fahmi Gunawan",
    ];

    await tester.pumpWidget(makeTestableWidget(child: about));
    for (int i = 0; i < teamMembers.length; i++) {
      expect(find.text(teamMembers[i]), findsOneWidget);
    }
  });

  testWidgets('About Page: Find Explanation words', (WidgetTester tester) async {
    Key key = new Key("Explanation");
    await tester.pumpWidget(makeTestableWidget(child: about));
    expect(find.byKey(key), findsOneWidget);
  });
}
