import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'dart:convert';
import 'package:image_test_utils/image_test_utils.dart';

import 'package:ScrumBooster/ScrumPhase/SprintEvaluation/ApiProvider.dart';
import 'package:ScrumBooster/Utils/utils.dart';
import 'package:ScrumBooster/ScrumPhase/SprintEvaluation/SprintEvaluation.dart';

void main() {
  final util = new Util();
  final widgetTestingApiProvider = SprintEvaluationApiProvider();

  //Test Mocking Initialization
  widgetTestingApiProvider.client = MockClient((request) async {
    final mapJSON = util.getDummyJSONCeremoniesAndProblems();
    return Response(json.encode(mapJSON), 200);
  });

  final SprintEvaluation sprintEvaluation = SprintEvaluation(
    apiProvider: widgetTestingApiProvider,
  );

  //Sprint Evaluation Phase Widget Tests
  testWidgets('Detect Loading Animation', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
          util.makeTestableWidget(child: sprintEvaluation)
      );
      String key = "Loading Data";
      expect(find.byKey(Key(key)), findsOneWidget);
    });
  });

  testWidgets('Find Header', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
          util.makeTestableWidget(child: sprintEvaluation)
      );
      await tester.pump();

      String header = "SPRINT EVALUATION";
      expect(find.text(header), findsOneWidget);
    });
  });

  testWidgets('Test Find Product Header 1', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
          util.makeTestableWidget(child: sprintEvaluation)
      );
      await tester.pump();
      String menu1 = "Things you should be doing:";
      expect(find.text(menu1), findsOneWidget);
    });
  });

  testWidgets('Test Not Find Product Header 1', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
          util.makeTestableWidget(child: sprintEvaluation)
      );
      await tester.pump();
      String menu1 = "Things you shouldn't be doing:";
      expect(find.text(menu1), findsNothing);
    });
  });

  testWidgets('Test Find Product Header 2', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
          util.makeTestableWidget(child: sprintEvaluation)
      );
      await tester.pump();
      String menu1 = "Problems you might have face:";
      expect(find.text(menu1), findsOneWidget);
    });
  });

  testWidgets('Test Not Find Product Header 2', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
          util.makeTestableWidget(child: sprintEvaluation)
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
          util.makeTestableWidget(child: sprintEvaluation)
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
        util.makeTestableWidget(child: sprintEvaluation),
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

//  testWidgets('Home Screen Drawer Test', (WidgetTester tester) async {
//    GlobalKey<ScaffoldState> scaffoldKey = sprintEvaluation.getScaffoldKey();
//    await tester.pumpWidget(util.makeTestableWidget(child: sprintEvaluation));
//    Key menu1 = new Key("Home");
//    Key menu2 = new Key("Ceremonies");
//    Key menu3 = new Key("Problems");
//    Key menu4 = new Key("Glossary");
//    Key menu5 = new Key("Pop Quiz!");
//    Key menu6 = new Key("About");
//
//    scaffoldKey.currentState.openDrawer();
//    await tester.pump();
//
//    expect(find.byKey(menu1), findsOneWidget);
//    expect(find.byKey(menu2), findsOneWidget);
//    expect(find.byKey(menu3), findsOneWidget);
//    expect(find.byKey(menu4), findsOneWidget);
//    expect(find.byKey(menu5), findsOneWidget);
//    expect(find.byKey(menu6), findsOneWidget);
//  });
}
