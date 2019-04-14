import 'package:flutter_test/flutter_test.dart';

import 'package:ScrumBooster/Utils/utils.dart';

void main() {
  test('Util value', () {
    final util = Util();

    util.callUtil();

    expect(util.call, "call");
  });
}
