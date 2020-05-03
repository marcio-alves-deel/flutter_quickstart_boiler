import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_quickstart_boiler/core.dart' show Translations;

class TranslationsDelegate extends LocalizationsDelegate<Translations> {
  const TranslationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['pt', 'en'].toList().contains(locale.languageCode);

  @override
  Future<Translations> load(Locale locale) => Translations.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<Translations> old) => false;
}
