import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'dart:convert';
import 'package:image_test_utils/image_test_utils.dart';

import 'package:ScrumBooster/ScrumPhase/SprintPlanning/ApiProvider.dart';
import 'package:ScrumBooster/Utils/utils.dart';
import 'package:ScrumBooster/ScrumPhase/SprintPlanning/SprintPlanning.dart';

void main() {
  final util = new Util();
  final widgetTestingApiProvider = SprintPlanningApiProvider();

  //Test Mocking Initialization
  widgetTestingApiProvider.client = MockClient((request) async {
    final mapJSON = util.getDummyJSONCeremoniesAndProblems();
    return Response(json.encode(mapJSON), 200);
  });

  final SprintPlanning sprintPlanning = SprintPlanning(
    apiProvider: widgetTestingApiProvider,
  );

  //Sprint Planning Phase Widget Tests
  testWidgets('Detect Loading Animation', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
          util.makeTestableWidget(child: sprintPlanning)
      );
      String key = "Loading Data";
      expect(find.byKey(Key(key)), findsOneWidget);
    });
  });

  testWidgets('Detect Progress Bar', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
          util.makeTestableWidget(child: sprintPlanning)
      );
      String keyA = "button a";
      String keyB = "button b";
      String keyC = "button c";
      String keyD = "button d";
      expect(find.byKey(Key(keyA)), findsOneWidget);
      expect(find.byKey(Key(keyB)), findsOneWidget);
      expect(find.byKey(Key(keyC)), findsOneWidget);
      expect(find.byKey(Key(keyD)), findsOneWidget);
    });
  });

  testWidgets('Detect Progress Arrow', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
          util.makeTestableWidget(child: sprintPlanning)
      );
      String keyA = "left arrow";
      String keyB = "right arrow";
      expect(find.byKey(Key(keyA)), findsOneWidget);
      expect(find.byKey(Key(keyB)), findsOneWidget);
    });
  });

  testWidgets('Find Header', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
          util.makeTestableWidget(child: sprintPlanning)
      );
      await tester.pump();

      String header = "SPRINT PLANNING";
      expect(find.text(header), findsOneWidget);
    });
  });

  testWidgets('Test Find Product Header 1', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
          util.makeTestableWidget(child: sprintPlanning)
      );
      await tester.pump();
      String menu1 = "Things you should be doing:";
      expect(find.text(menu1), findsOneWidget);
    });
  });

  testWidgets('Test Not Find Product Header 1', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
          util.makeTestableWidget(child: sprintPlanning)
      );
      await tester.pump();
      String menu1 = "Things you shouldn't be doing:";
      expect(find.text(menu1), findsNothing);
    });
  });

  testWidgets('Test Find Product Header 2', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
          util.makeTestableWidget(child: sprintPlanning)
      );
      await tester.pump();
      String menu1 = "Problems you might have face:";
      expect(find.text(menu1), findsOneWidget);
    });
  });

  testWidgets('Test Not Find Product Header 2', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
          util.makeTestableWidget(child: sprintPlanning)
      );
      await tester.pump();
      String menu1 = "Problems you might have not face:";
      expect(find.text(menu1), findsNothing);
    });
  });

  testWidgets('Test Find Ceremony Content Names', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      List<String> contentNames = <String>[
        "Backlog Grooming",
      ];

      await tester.pumpWidget(
          util.makeTestableWidget(child: sprintPlanning)
      );
      await tester.pump();

      for (int i = 0; i < contentNames.length; i++) {
        expect(find.byWidgetPredicate((widget) {
          if (widget is Text) {
            final Text textWidget = widget;
            if (textWidget.data != null) {
              return textWidget.data.contains(contentNames[i]);
            }
            return textWidget.textSpan.toPlainText().contains(contentNames[i]);
          }
          return false;
        }), findsOneWidget);
      }
    });
  });

  testWidgets('Test Find Problem Names', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      List<String> problemNames = <String>[
        "Project Estimates Are Unrealistic or Unknown",
      ];

      await tester.pumpWidget(
        util.makeTestableWidget(child: sprintPlanning),
      );
      await tester.pump();

      for (int i = 0; i < problemNames.length; i++) {
        expect(find.byWidgetPredicate((widget) {
          if (widget is Text) {
            final Text textWidget = widget;
            if (textWidget.data != null) {
              return textWidget.data.contains(problemNames[i]);
            }
            return textWidget.textSpan.toPlainText().contains(problemNames[i]);
          }
          return false;
        }), findsOneWidget);
      }
    });
  });

  testWidgets('Drawer Test', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      GlobalKey<ScaffoldState> scaffoldKey = sprintPlanning.getScaffoldKey();
      await tester.pumpWidget(
          util.makeTestableWidget(child: sprintPlanning)
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
