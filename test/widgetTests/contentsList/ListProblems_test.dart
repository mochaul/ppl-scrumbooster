import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ScrumBooster/contentsList/ListProblems.dart';
import 'package:ScrumBooster/utils/utils.dart';

void main() {
  final ListProblems listProblems = ListProblems();
  final util = new Util();

  //Problems Widget Tests
  testWidgets('Test Find List Problems', (WidgetTester tester) async {
    await tester.pumpWidget(util.makeTestableWidget(child: listProblems));
    String header1 = "PROBLEMS";
    expect(find.text(header1), findsOneWidget);
  });
}