import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:ScrumBooster/Utils/utils.dart';
import 'package:ScrumBooster/contentsList/ListGlossary/ListGlossary.dart';

void main() {
  final ListGlossary glossary = ListGlossary();
  final util = new Util();

  //Glossary Page Widget Tests
  testWidgets('Test Find List Glossary', (WidgetTester tester) async {
    await tester.pumpWidget(util.makeTestableWidget(child: glossary));
    String header1 = "GLOSSARY";
    expect(find.text(header1), findsOneWidget);
  });

  testWidgets('Home Screen Drawer Test', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      GlobalKey<ScaffoldState> scaffoldKey = glossary.getScaffoldKey();
      await tester.pumpWidget(
        util.makeTestableWidget(child: glossary)
      );
      await tester.pump();

      Key menu1 = new Key("Home");
      Key menu2 = new Key("Ceremonies");
      Key menu3 = new Key("Problems");
      Key menu4 = new Key("Glossary");
      Key menu5 = new Key("About");

      scaffoldKey.currentState.openDrawer();
      await tester.pump();

      expect(find.byKey(menu1), findsOneWidget);
      expect(find.byKey(menu2), findsOneWidget);
      expect(find.byKey(menu3), findsOneWidget);
      expect(find.byKey(menu4), findsOneWidget);
      expect(find.byKey(menu5), findsOneWidget);
    });
  });
}
