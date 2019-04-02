import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:ScrumBooster/contentsList/ListCeremonies.dart';
import 'package:ScrumBooster/utils/utils.dart';

void main() {
  final ListCeremonies listCeremonies = ListCeremonies();
  final util = new Util();

  //Ceremonies Widget Tests
  testWidgets('Test Find List Ceremonies', (WidgetTester tester) async {
    await tester.pumpWidget(util.makeTestableWidget(child: listCeremonies));
    String header1 = "CEREMONIES";
    expect(find.text(header1), findsOneWidget);
  });
}