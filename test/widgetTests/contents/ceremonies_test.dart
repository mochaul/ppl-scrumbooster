import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ScrumBooster/Utils/utils.dart';
import 'package:ScrumBooster/contents/ceremonies.dart';

void main() {
  final util = new Util();
  final Ceremonies ceremonies = Ceremonies(
    title: "Backlog Grooming".toUpperCase(),
    imagePath: "assets/logos/logo-color.png",
    contents: "testing",
  );

  //Ceremony Page Widget Tests
  testWidgets('Test Find Title Ceremonies', (WidgetTester tester) async {
    await tester.pumpWidget(util.makeTestableWidget(child: ceremonies));
    String title = "BACKLOG GROOMING";
    expect(find.text(title), findsOneWidget);
  });

  testWidgets('Test Find Content Ceremonies', (WidgetTester tester) async {
    await tester.pumpWidget(util.makeTestableWidget(child: ceremonies));
    String content = "testing";
    expect(find.text(content), findsOneWidget);
  });
}
