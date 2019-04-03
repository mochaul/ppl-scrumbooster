import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ScrumBooster/utils/utils.dart';

import 'package:ScrumBooster/initScreen/HomeScreen.dart';

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

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  //Image Assets Widget Testing
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

  test('AssetImage from package', () {
    const AssetImage image = AssetImage(
      'assets/listCeremonies/ceremonies.png',
      package: 'test_package',
    );
    expect(image.keyName, 'packages/test_package/assets/listCeremonies/ceremonies.png');
  });

  test('AssetImage from package', () {
    const AssetImage image = AssetImage(
      'assets/listProblems/problems.png',
      package: 'test_package',
    );
    expect(image.keyName, 'packages/test_package/assets/listProblems/problems.png');
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
}
