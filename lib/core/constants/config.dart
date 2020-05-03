import 'dart:convert';
import 'package:flutter/services.dart';

class AppConfig {
  String apiBaseUrl;

  AppConfig({this.apiBaseUrl});

  static Future<AppConfig> forEnvironment(String env) async {
    final contents = await rootBundle.loadString(
      'lib/core/constants/envs/$env.json',
    );
    final json = jsonDecode(contents);

    return AppConfig.fromJson(json);
  }

  AppConfig.fromJson(Map<String, dynamic> json)
      : apiBaseUrl = json['apiBaseUrl'];
}
