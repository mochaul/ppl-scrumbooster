import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  //Image Assets Widget Testing
  test('AssetImage Product backlog from package', () {
    const AssetImage image = AssetImage(
      'assets/homepage/Product_Backlog.png',
      package: 'test_package',
    );
    expect(image.keyName, 'packages/test_package/assets/homepage/Product_Backlog.png');
  });

  test('AssetImage sprint planning from package', () {
    const AssetImage image = AssetImage(
      'assets/homepage/Sprint_Planning.png',
      package: 'test_package',
    );
    expect(image.keyName, 'packages/test_package/assets/homepage/Sprint_Planning.png');
  });

  test('AssetImage from package', () {
    const AssetImage image = AssetImage(
      'assets/listCeremonies/ceremonies.png',
      package: 'test_package',
    );
    expect(image.keyName, 'packages/test_package/assets/listCeremonies/ceremonies.png');
  });

  test('AssetImage from package', () {
    const AssetImage image = AssetImage(
      'assets/listProblems/problems.png',
      package: 'test_package',
    );
    expect(image.keyName, 'packages/test_package/assets/listProblems/problems.png');
  });

  test('AssetImage from package', () {
    const AssetImage logo = AssetImage(
      'assets/logos/logo-color.png',
      package: 'test_package',
    );
    const AssetImage makara = AssetImage(
      'assets/logos/Makara-UI.png',
      package: 'test_package',
    );
    const AssetImage glossary = AssetImage(
      'assets/listGlossary/glossary.png',
      package: 'test_package',
    );
    expect(logo.keyName, 'packages/test_package/assets/logos/logo-color.png');
    expect(makara.keyName, 'packages/test_package/assets/logos/Makara-UI.png');
    expect(glossary.keyName, 'packages/test_package/assets/listGlossary/glossary.png');
  });

  test('AssetImage sprint exe from package', () {
    const AssetImage image = AssetImage(
      'assets/homepage/Sprint_Exe.png',
      package: 'test_package',
    );
    expect(image.keyName, 'packages/test_package/assets/homepage/Sprint_Exe.png');
  });

  test('AssetImage sprint evaluation from package', () {
    const AssetImage image = AssetImage(
      'assets/homepage/Sprint_Evaluation.png',
      package: 'test_package',
    );
    expect(image.keyName, 'packages/test_package/assets/homepage/Sprint_Evaluation.png');
  });
}