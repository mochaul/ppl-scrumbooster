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
    await binding.setSurfaceSize(Size(5000, 5000));
    final String firstLine = "WELCOME !";

    await tester.pumpWidget(util.makeTestableWidget(child: boardingPage));
    expect(find.text(firstLine), findsNWidgets(2));
  });

  testWidgets('Find second line of word', (WidgetTester tester) async {
    await binding.setSurfaceSize(Size(5000, 5000));
    final String firstLine = "WE'RE HERE";

    await tester.pumpWidget(util.makeTestableWidget(child: boardingPage));
    expect(find.text(firstLine), findsNWidgets(2));
  });

  testWidgets('Find third line of word', (WidgetTester tester) async {
    await binding.setSurfaceSize(Size(5000, 5000));
    final String firstLine = "TO HELP YOU";

    await tester.pumpWidget(util.makeTestableWidget(child: boardingPage));
    expect(find.text(firstLine), findsNWidgets(2));
  });

  testWidgets('Find fourth line of word', (WidgetTester tester) async {
    await binding.setSurfaceSize(Size(5000, 5000));
    final String firstLine = "MAXIMIZE";

    await tester.pumpWidget(util.makeTestableWidget(child: boardingPage));
    expect(find.text(firstLine), findsNWidgets(2));
  });

  testWidgets('Find fifth line of word', (WidgetTester tester) async {
    await binding.setSurfaceSize(Size(5000, 5000));
    final String firstLine = "YOUR SCRUM";

    await tester.pumpWidget(util.makeTestableWidget(child: boardingPage));
    expect(find.text(firstLine), findsNWidgets(2));
  });

  testWidgets('Find sixth line of word', (WidgetTester tester) async {
    await binding.setSurfaceSize(Size(5000, 5000));
    final String firstLine = "CEREMONY";

    await tester.pumpWidget(util.makeTestableWidget(child: boardingPage));
    expect(find.text(firstLine), findsNWidgets(2));
  });

  testWidgets('Find button text', (WidgetTester tester) async {
    await binding.setSurfaceSize(Size(5000, 5000));
    final String buttonText = "Get Started";

    await tester.pumpWidget(util.makeTestableWidget(child: boardingPage));
    expect(find.text(buttonText), findsOneWidget);
  });
}