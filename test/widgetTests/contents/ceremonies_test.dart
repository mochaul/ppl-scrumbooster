import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'dart:convert';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:ScrumBooster/ScrumPhase/ProcessAreaCMMI/ApiProvider.dart';

import 'package:ScrumBooster/ScrumPhase/ProcessAreaCMMI/ApiProvider.dart';
import 'package:ScrumBooster/contents/ceremonies.dart';
import 'package:ScrumBooster/Utils/utils.dart';

void main() {
  final util = new Util();
  final widgetTestingApiProvider = ProcessAreaCMMIFetcher();

  widgetTestingApiProvider.client = MockClient((request) async {
    final mapJSON = util.getDummyJSONCMMIPractices();
    return Response(json.encode(mapJSON), 200);
  });

  final Ceremonies ceremonies = Ceremonies(
    id: 1,
    title: "Backlog Grooming",
    imagePath: "https://images.unsplash.com/photo-1512758017271-d7b84c2113f1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80",
    contents: "Backlog grooming (sometimes called “story time”) is a common agile technique used by Scrum teams to produce a prioritized backlog of epics and user stories before and during a sprint. Grooming that takes place during a sprint is sometimes referred to as micro-grooming”. \n\nBacklog grooming typically includes a negotiation between the product owner and Scrum team on the epics or user stories that will be added, removed, or revised for each sprint. All relevant stakeholders have input into this collaborative decision. As such, it is a critical activity related to the planning and execution of a sprint.\n\nCMMI can strengthen backlog grooming by guiding team members toward better and stronger ways to produce a streamlined backlog with robust user stories. If the purpose of backlog grooming is to ensure clarity and readiness for the sprint planning, then Requirements Management (REQM) offers a framework for ensuring that an agile team can agree to, understand, and manage its requirements using criteria that identify a “Definition of Done” for each story or epic.\n",
    apiProvider: ProcessAreaCMMIFetcher(),
  );

  //Ceremony Page Widget Tests
  testWidgets('Test do not Find Title Ceremonies', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(util.makeTestableWidget(child: ceremonies));
      String title = "Backlooog Grooming";
      expect(find.text(title), findsNothing);
    });
  });

  testWidgets('Test do not Find Content Ceremonies', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(util.makeTestableWidget(child: ceremonies));
      String content = "testing";
      expect(find.text(content), findsNothing);
    });
  });

  testWidgets('do not detect Alignment', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
          util.makeTestableWidget(child: ceremonies)
      );
      String keyA = "Alignment 2";
      expect(find.byKey(Key(keyA)), findsNothing);
    });
  });
}
