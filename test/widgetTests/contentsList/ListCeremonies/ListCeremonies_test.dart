import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'dart:convert';
import 'package:image_test_utils/image_test_utils.dart';

import 'package:ScrumBooster/contentsList/ListCeremonies/ApiProvider.dart';
import 'package:ScrumBooster/Utils/utils.dart';
import 'package:ScrumBooster/contentsList/ListCeremonies/ListCeremonies.dart';

void main() {

  final util = new Util();
  final widgetTestingApiProvider = ListCeremoniesApiProvider();

  //Test Mocking Initialization
  widgetTestingApiProvider.client = MockClient((request) async {
    final mapJSON = util.getDummyJSONContentsList();
    return Response(json.encode(mapJSON), 200);
  });

  final ListCeremonies listCeremonies = ListCeremonies(
    apiProvider: widgetTestingApiProvider,
  );

  //Ceremonies List Widget Tests
  testWidgets('Detect Loading Animation', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
          util.makeTestableWidget(child: listCeremonies)
      );
      String key = "Loading Data";
      expect(find.byKey(Key(key)), findsOneWidget);
    });
  });


  testWidgets('Find Header', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
        util.makeTestableWidget(child: listCeremonies)
      );
      await tester.pump();

      String header1 = "CEREMONIES";
      expect(find.text(header1), findsOneWidget);
    });
  });

  testWidgets('Find Wrong Header', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
          util.makeTestableWidget(child: listCeremonies)
      );
      await tester.pump();

      String header1 = "PROBLEMS";
      expect(find.text(header1), findsNothing);
    });
  });

  testWidgets('Find Alphabets from JSON', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
          util.makeTestableWidget(child: listCeremonies)
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
          util.makeTestableWidget(child: listCeremonies)
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

  testWidgets('Drawer Test', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      GlobalKey<ScaffoldState> scaffoldKey = listCeremonies.getScaffoldKey();
      await tester.pumpWidget(
          util.makeTestableWidget(child: listCeremonies)
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
  });
}