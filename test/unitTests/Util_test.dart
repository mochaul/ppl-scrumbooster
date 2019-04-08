import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ScrumBooster/utils/utils.dart';

void main() {
  test('Util value', () {
    final util = Util();

    util.callUtil();

    expect(util.call, "call");
  });
}
