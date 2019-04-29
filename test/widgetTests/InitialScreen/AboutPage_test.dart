import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ScrumBooster/InitialScreen/AboutPage.dart';
import 'package:ScrumBooster/Utils/utils.dart';

void main() {
  final AboutPage about = AboutPage();
  final util = new Util();

  //About Page Widget Tests
  testWidgets('About Page: Find Logos', (WidgetTester tester) async {
    List<String> keys = <String>[
      "Scrum Booster Logo",
      "Makara UI Logo",
    ];

    await tester.pumpWidget(util.makeTestableWidget(child: about));
    for (int i = 0; i < keys.length; i++) {
      expect(find.byKey(new Key(keys[i])), findsOneWidget);
    }
  });

  testWidgets('About Page: Find Team Members Text', (WidgetTester tester) async {
    List<String> teamMembers = <String>[
      "Eko K. Budiardjo",
      "Suci Fadhilah",
      "Arfi Renaldi",
      "Mochamad Aulia Akbar Praditomo",
      "Fajrin Maulana Kingwijati",
      "Izzan Fakhril Islam",
      "Muhammad Rezki",
      "Khoirul Khuluqi Abdulloh",
      "Wildan Fahmi Gunawan",
    ];

    await tester.pumpWidget(util.makeTestableWidget(child: about));
    for (int i = 0; i < teamMembers.length; i++) {
      expect(find.text(teamMembers[i]), findsOneWidget);
    }
  });

  testWidgets('About Page: Find Explanation words', (WidgetTester tester) async {
    Key key = new Key("Explanation");
    await tester.pumpWidget(util.makeTestableWidget(child: about));
    expect(find.byKey(key), findsOneWidget);
  });

}
