import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'dart:convert';
import 'package:image_test_utils/image_test_utils.dart';

import 'package:ScrumBooster/ScrumPhase/ProcessAreaCMMI/ApiProvider.dart';
import 'package:ScrumBooster/contents/ceremonies.dart';
import 'package:ScrumBooster/Utils/utils.dart';

void main() {
  final util = new Util();
  final widgetTestingApiProvider = ProcessAreaCMMIFetcher();


  final Ceremonies ceremonies = Ceremonies(
    title: "Backlog Grooming".toUpperCase(),
    imagePath: "https://static1.squarespace.com/static/56c775ad27d4bd3fdb24775d/t/5a8b201324a694d7071662ee/1519067160925/dummy+logo.jpg",
    contents: "testing",
  );

  //Ceremony Page Widget Tests
  testWidgets('Test Find Title Ceremonies', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(util.makeTestableWidget(child: ceremonies));
      String title = "BACKLOG GROOMING";
      expect(find.text(title), findsOneWidget);
    });
  });

  testWidgets('Test Find Content Ceremonies', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(util.makeTestableWidget(child: ceremonies));
      String content = "testing";
      expect(find.text(content), findsOneWidget);
    });
  });
}
