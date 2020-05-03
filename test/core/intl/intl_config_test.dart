import 'package:flutter_quickstart_boiler/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  setUp(() {});

  group('intl', () {
    test(
      'should return correct strings when location is equal en_US',
      () async {
        Translations tTranslations =
            await Translations.load(Locale('en', 'US'));

        expect(tTranslations.lang, 'en_US');
      },
    );

    test(
      'should return correct strings when locations is equal pt_BR',
      () async {
        Translations tTranslations =
            await Translations.load(Locale('pt', 'BR'));

        expect(tTranslations.lang, 'pt_BR');
      },
    );

    test(
      'should return default strings when no location is provided',
      () async {
        Translations tTranslations = await Translations.load();

        expect(tTranslations.lang, 'default');
      },
    );
  });
}
