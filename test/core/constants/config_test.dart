import 'dart:convert';
import 'package:flutter_quickstart_boiler/core.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  final tAppConfig = AppConfig(apiBaseUrl: 'https://api.example.com/');

  group('global config', () {
    test(
      'should return a AppConfig with complete data',
      () async {
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('config.json'));
        final result = AppConfig.fromJson(jsonMap);

        expect(result.apiBaseUrl, tAppConfig.apiBaseUrl);
      },
    );
  });
}
