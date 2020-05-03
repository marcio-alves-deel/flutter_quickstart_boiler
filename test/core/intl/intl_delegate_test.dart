import 'package:flutter_quickstart_boiler/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  setUp(() {});

  group('intl delegate', () {
    test(
      'should return true for valid locations',
      () async {
        final tResult = TranslationsDelegate().isSupported(Locale('en', 'US'));

        expect(tResult, true);
      },
    );

    test(
      'should return false for invalid locations',
      () async {
        final tResult = TranslationsDelegate().isSupported(Locale('fr'));

        expect(tResult, false);
      },
    );

    test(
      'should load locations correctly',
      () async {
        final tResult = await TranslationsDelegate().load(Locale('en', 'US'));

        expect(tResult.lang, 'en_US');
      },
    );
  });
}
