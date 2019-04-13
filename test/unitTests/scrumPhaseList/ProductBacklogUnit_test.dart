import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ScrumBooster/Utils/utils.dart';
import 'package:ScrumBooster/ScrumPhase/ProductBacklog/ProductBacklog.dart';

void main() {
  final ProductBacklog productBacklog = ProductBacklog();
  test('Util value', () {
    final util = productBacklog.util;

    util.callUtil();

    expect(util.call, "call");
  });
}
