import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'dart:convert';
import 'package:image_test_utils/image_test_utils.dart';

import 'package:ScrumBooster/ScrumPhase/ProcessAreaCMMI/ApiProvider.dart';
import 'package:ScrumBooster/contents/ceremonies.dart';
import 'package:ScrumBooster/Utils/utils.dart';

void main() async {
  const int CEREMONY_ID = 1;
  final util = new Util();
  final processAreaCMMIFetcher = ProcessAreaCMMIFetcher();

  processAreaCMMIFetcher.client = MockClient((request) async {
    final mapJSON = util.getDummyJSONProcessAreas();
    return Response(json.encode(mapJSON), 200);
  });

  await processAreaCMMIFetcher.fetchPosts(CEREMONY_ID);
  var processAreaByCeremony = processAreaCMMIFetcher.getProcessAreasByCeremony();
  final cmmiPracticeFetcher = CMMIPracticesFetcher(
    processAreasByCeremony: processAreaByCeremony,
  );

  cmmiPracticeFetcher.client = MockClient((request) async {
    final mapJSON = util.getDummyJSONCMMIPractices();
    return Response(json.encode(mapJSON), 200);
  });

  final Ceremonies ceremonies = Ceremonies(
    id: CEREMONY_ID,
    title: "Backlog Grooming",
    imagePath: "https://images.unsplash.com/photo-1512758017271-d7b84c2113f1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80",
    contents: "This is dummy content for Backlog Grooming",
    processAreaApiProvider: processAreaCMMIFetcher,
    cmmiPracticesApiProvider: cmmiPracticeFetcher,
  );

  //Ceremony Page Widget Tests
  testWidgets('Detect Loading Animation', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
        util.makeTestableWidget(child: ceremonies)
      );
      String key = "Loading Data";
      expect(find.byKey(Key(key)), findsOneWidget);
    });
  });


  testWidgets('Test Find Ceremony Title', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
        util.makeTestableWidget(child: ceremonies)
      );
      await tester.pump();

      String title = "Backlog Grooming";
      expect(find.text(title), findsOneWidget);
    });
  });

  testWidgets('Test Find Ceremony Content', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
        util.makeTestableWidget(child: ceremonies)
      );
      await tester.pump();

      String content = "This is dummy content for Backlog Grooming";
      expect(find.byWidgetPredicate(
        (Widget widget) => widget is RichText &&
            widget.toString() == 'RichText(softWrap: wrapping at box width, '
                'maxLines: unlimited, text: "$content")',
        description: 'Finding RichText content',
      ), findsOneWidget);
    });
  });

  testWidgets('Test Find Process Area Items', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
        util.makeTestableWidget(child: ceremonies)
      );
      await tester.pump();

      List<String> processAreas = [
        "- Dummy Process Area 1",
        "- Dummy Process Area 2",
      ];
      for (String item in processAreas) {
        print(item);
        expect(find.text(item), findsNWidgets(2));
      }
    });
  });

  testWidgets('Test do not Find Ceremony Title', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
        util.makeTestableWidget(child: ceremonies)
      );
      await tester.pump();

      String wrongTitle = "Product Backlog";
      expect(find.text(wrongTitle), findsNothing);
    });
  });

  testWidgets('Test do not Find Content Ceremonies', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
        util.makeTestableWidget(child: ceremonies)
      );
      await tester.pump();

      String content = "testing";
      expect(find.text(content), findsNothing);
    });
  });

  testWidgets('Test Detect Alignment', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
          util.makeTestableWidget(child: ceremonies)
      );
      String keyA = "Alignment 1";
      expect(find.byKey(Key(keyA)), findsNothing);
    });
  });

  testWidgets('Drawer Test', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      GlobalKey<ScaffoldState> scaffoldKey = ceremonies.getScaffoldKey();
      await tester.pumpWidget(
        util.makeTestableWidget(child: ceremonies)
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
