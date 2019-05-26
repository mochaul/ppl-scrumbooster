import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'dart:convert';
import 'package:image_test_utils/image_test_utils.dart';

import 'package:ScrumBooster/contents/Problems/ApiProvider.dart';
import 'package:ScrumBooster/contents/Problems/problems.dart';
import 'package:ScrumBooster/Utils/utils.dart';

void main() async {
  const int PROBLEM_ID = 1;
  final util = new Util();
  final ProblemsDetailPageApiProvider apiProvider = ProblemsDetailPageApiProvider();

  apiProvider.client = MockClient((request) async {
    final mapJSON = util.getDummyJSONCeremonies();
    return Response(json.encode(mapJSON), 200);
  });

  final ProblemsContentPage problemsContentPage = ProblemsContentPage(
    id: PROBLEM_ID,
    title: "Problem Example 1",
    imagePath: "https://static1.squarespace.com/static/56c775ad27d4bd3fdb24775d/t/5a8b201324a694d7071662ee/1519067160925/dummy+logo.jpg",
    contents: "This is an example for Problem 1",
    canBeSolvedUsing: [
      1,
      2,
      3,
    ],
    apiProvider: apiProvider,
  );

  //Problem Content Page Widget Tests
  testWidgets('Detect Loading Animation', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
        util.makeTestableWidget(child: problemsContentPage)
      );
      String key = "Loading Data";
      expect(find.byKey(Key(key)), findsOneWidget);
    });
  });

  testWidgets('Test Find Problem Title', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
        util.makeTestableWidget(child: problemsContentPage)
      );
      await tester.pump();

      String title = "Problem Example 1";
      expect(find.text(title), findsOneWidget);
    });
  });

  testWidgets('Test Find Problem Content', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
          util.makeTestableWidget(child: problemsContentPage)
      );
      await tester.pump();

      String content = "This is an example for Problem 1";
      expect(find.byWidgetPredicate(
        (Widget widget) => widget is RichText &&
          widget.toString() == 'RichText(softWrap: wrapping at box width, '
            'maxLines: unlimited, text: "$content")',
        description: 'Finding RichText content',
      ), findsOneWidget);
    });
  });

  testWidgets('Test Find Ceremony Items', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
          util.makeTestableWidget(child: problemsContentPage)
      );
      await tester.pump();

      List<String> ceremonies = [
        "- Dummy Ceremony 1",
        "- Dummy Ceremony 2",
        "- Dummy Ceremony 3",
      ];
      for (String item in ceremonies) {
        expect(find.text(item), findsNWidgets(4));
      }
    });
  });

  testWidgets('Test do not Find Problem Title', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
          util.makeTestableWidget(child: problemsContentPage)
      );
      await tester.pump();

      String wrongTitle = "Product Backlog";
      expect(find.text(wrongTitle), findsNothing);
    });
  });

  testWidgets('Test do not Find Content Problem', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
          util.makeTestableWidget(child: problemsContentPage)
      );
      await tester.pump();

      String content = "testing";
      expect(find.text(content), findsNothing);
    });
  });

  testWidgets('Drawer Test', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      GlobalKey<ScaffoldState> scaffoldKey = problemsContentPage.getScaffoldKey();
      await tester.pumpWidget(
          util.makeTestableWidget(child: problemsContentPage)
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
