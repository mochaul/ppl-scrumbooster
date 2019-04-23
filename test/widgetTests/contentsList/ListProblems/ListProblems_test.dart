import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'dart:convert';
import 'package:image_test_utils/image_test_utils.dart';

import 'package:ScrumBooster/contentsList/ListProblems/ApiProvider.dart';
import 'package:ScrumBooster/Utils/utils.dart';
import 'package:ScrumBooster/contentsList/ListProblems/ListProblems.dart';

void main() {

  final util = new Util();
  final widgetTestingApiProvider = ListProblemsApiProvider();

  //Test Mocking Initialization
  widgetTestingApiProvider.client = MockClient((request) async {
    final mapJSON = util.getDummyJSONContentsList();
    return Response(json.encode(mapJSON), 200);
  });

  final ListProblems listProblems = ListProblems(
    apiProvider: widgetTestingApiProvider,
  );

  //Ceremonies List Widget Tests
  testWidgets('Detect Loading Animation', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
          util.makeTestableWidget(child: listProblems)
      );
      String key = "Loading Data";
      expect(find.byKey(Key(key)), findsOneWidget);
    });
  });


  testWidgets('Find Header', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
          util.makeTestableWidget(child: listProblems)
      );
      await tester.pump();

      String header1 = "CEREMONIES";
      expect(find.text(header1), findsOneWidget);
    });
  });

  testWidgets('Find Wrong Header', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
          util.makeTestableWidget(child: listProblems)
      );
      await tester.pump();

      String header1 = "PROBLEMS";
      expect(find.text(header1), findsNothing);
    });
  });

  testWidgets('Find Alphabets from JSON', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
          util.makeTestableWidget(child: listProblems)
      );
      await tester.pump();

      List<String> alphabets = [
        "A",
        "B",
        "C",
      ];

      for (String alphabet in alphabets) {
        expect(find.text(alphabet), findsOneWidget);
      }
    });
  });

  testWidgets('Find Item Title', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
          util.makeTestableWidget(child: listProblems)
      );
      await tester.pump();

      List<String> titles = [
        "A Letter",
        "B Letter",
        "C Letter",
      ];

      for (String title in titles) {
        expect(find.text(title), findsOneWidget);
      }
    });
  });

  testWidgets('Home Screen Drawer Test', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      GlobalKey<ScaffoldState> scaffoldKey = listProblems.getScaffoldKey();
      await tester.pumpWidget(
          util.makeTestableWidget(child: listProblems)
      );
      await tester.pump();

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
  });
}