import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ScrumBooster/utils/utils.dart';
import 'package:ScrumBooster/contentsList/GlossaryPage.dart';

void main() {
  final GlossaryPage glossary = GlossaryPage();
  final util = new Util();

  //Glossary Page Widget Tests
  testWidgets('Test Find List Glossary', (WidgetTester tester) async {
    await tester.pumpWidget(util.makeTestableWidget(child: glossary));
    String header1 = "GLOSSARY";
    expect(find.text(header1), findsOneWidget);
  });
}