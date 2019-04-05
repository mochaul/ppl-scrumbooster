import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ScrumBooster/initScreen/BoardingPage.dart';
import 'package:ScrumBooster/utils/utils.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
    TestWidgetsFlutterBinding.ensureInitialized();
  final BoardingPage boardingPage = BoardingPage();
  final util = new Util();

  testWidgets('Find first line of word', (WidgetTester tester) async {
    final String firstLine = "WELCOME TO SCRUM BOOSTER!";

    await tester.pumpWidget(util.makeTestableWidget(child: boardingPage));
    expect(find.text(firstLine), findsOneWidget);
  });

  testWidgets('Find second line of word', (WidgetTester tester) async {
    final String firstLine = "WE'RE HERE TO HELP YOU";

    await tester.pumpWidget(util.makeTestableWidget(child: boardingPage));
    expect(find.text(firstLine), findsOneWidget);
  });

  testWidgets('Find third line of word', (WidgetTester tester) async {
    final String firstLine = "TO MAXIMIZE";

    await tester.pumpWidget(util.makeTestableWidget(child: boardingPage));
    expect(find.text(firstLine), findsOneWidget);
  });

  testWidgets('Find fourth line of word', (WidgetTester tester) async {
    final String firstLine = "YOUR SCRUM CEREMONY";

    await tester.pumpWidget(util.makeTestableWidget(child: boardingPage));
    expect(find.text(firstLine), findsOneWidget);
  });


  testWidgets('Find button text', (WidgetTester tester) async {
    final String buttonText = "Get Started!";

    await tester.pumpWidget(util.makeTestableWidget(child: boardingPage));
    expect(find.text(buttonText), findsOneWidget);
  });
}
