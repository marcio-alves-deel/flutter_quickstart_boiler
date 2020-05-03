import 'dart:async';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'generated/messages_all.dart';

class Translations {
  static Future<Translations> load([Locale locale]) async {
    final String localeName =
        locale?.countryCode == null || locale.countryCode.isEmpty
            ? locale?.languageCode ?? 'default'
            : locale.toString();

    final String canonicalLocaleName = Intl.canonicalizedLocale(localeName);

    await initializeMessages(canonicalLocaleName);

    Intl.defaultLocale = canonicalLocaleName;

    return Translations();
  }

  static Translations of(BuildContext context) =>
      Localizations.of<Translations>(context, Translations);

  String get title => Intl.message('', name: 'title');
  String get lang => Intl.message('', name: 'lang');
}
