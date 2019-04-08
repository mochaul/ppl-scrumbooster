import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ScrumBooster/utils/utils.dart';
import 'package:ScrumBooster/scrumPhaseList/SprintPlanning.dart';

void main() {
  final SprintPlanning sprintPlanning = SprintPlanning();
  final util = new Util();

  testWidgets('Find Header', (WidgetTester tester) async {
    await tester.pumpWidget(util.makeTestableWidget(child: sprintPlanning));
    String menu1 = "SPRINT PLANNING";
    expect(find.text(menu1), findsOneWidget);
  });

  //Product Backlog Phase Widget Tests
  testWidgets('Test Find Product Header 1', (WidgetTester tester) async {
    await tester.pumpWidget(util.makeTestableWidget(child: sprintPlanning));
    String menu1 = "Things you should be doing:";
    expect(find.text(menu1), findsOneWidget);
  });

  testWidgets('Test Not Find Product Header 1', (WidgetTester tester) async {
    await tester.pumpWidget(util.makeTestableWidget(child: sprintPlanning));
    String menu1 = "Things you shouldn't be doing:";
    expect(find.text(menu1), findsNothing);
  });

  testWidgets('Test Find Product Header 2', (WidgetTester tester) async {
    await tester.pumpWidget(util.makeTestableWidget(child: sprintPlanning));
    String menu1 = "Problems you might have face:";
    expect(find.text(menu1), findsOneWidget);
  });

  testWidgets('Test Not Find Product Header 2', (WidgetTester tester) async {
    await tester.pumpWidget(util.makeTestableWidget(child: sprintPlanning));
    String menu1 = "Problems you might have not face:";
    expect(find.text(menu1), findsNothing);
  });

  testWidgets('Test Find Content Names', (WidgetTester tester) async {
    //TODO: Ubah jadi nama judul content
    List<String> contentNames = <String>[
      "Backlog Grooming",
      "content b",
      "content c",
      "content d",
      "content e",
      "content f",
    ];

    await tester.pumpWidget(util.makeTestableWidget(child: sprintPlanning));
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

  testWidgets('Test Find First 3 Problem Names', (WidgetTester tester) async {
    //TODO: Ubah jadi nama judul problem
    List<String> problemNames = <String>[
      "Poor Project Communication",
      "problem b",
      "problem c",
      "problem d",
      "problem e",
      "problem f",
    ];

    await tester.pumpWidget(util.makeTestableWidget(child: sprintPlanning));
    for (int i = 0; i < 3; i++) {
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
}
