import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ScrumBooster/contents/problems.dart';
import 'package:ScrumBooster/utils/utils.dart';

void main() {
  final ProblemsContentPage problemsContentPage = ProblemsContentPage(
    title: "Lorem Ipsum",
    imagePath: "assets/logos/logo-color.png",
    contents: "Lorem ipsum dolor sit amet.",
  );
  final util = new Util();

  //Problem Content Page Widget Tests
  testWidgets('Test Problems Content Page', (WidgetTester tester) async {
    await tester.pumpWidget(util.makeTestableWidget(child: problemsContentPage));

    Key mainStack = new Key("Main Stack");
    Key problemsContentImage = new Key("Problems Content Image");
    Key problemsContent = new Key("Problems Content");
    Key problemsTitleContainer = new Key("Problems Title Container");
    Key problemsTitleStack = new Key("Problems Title Stack");
    Key problemsTitle = new Key("Problems Title");
    Key problemsContentContainer = new Key("Problems Content Container");
    Key problemsContentText = new Key("Problems Content Text");

    expect(find.byKey(mainStack), findsOneWidget);
    expect(find.byKey(problemsContentImage), findsOneWidget);
    expect(find.byKey(problemsContent), findsOneWidget);
    expect(find.byKey(problemsTitleContainer), findsNWidgets(2));
    expect(find.byKey(problemsTitleStack), findsOneWidget);
    expect(find.byKey(problemsTitle), findsOneWidget);
    expect(find.byKey(problemsContentContainer), findsOneWidget);
    expect(find.byKey(problemsContentText), findsOneWidget);
  });
}
