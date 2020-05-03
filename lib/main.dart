import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_quickstart_boiler/core.dart'
    show AppConfig, Translations, TranslationsDelegate;
import 'package:provider/provider.dart';

void main() {
  runApp(FlutterBoilerApp());
}

class FlutterBoilerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => Translations.of(context).title,
      localizationsDelegates: [
        const TranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'),
        Locale('pt', 'BR'),
      ],
      home: FutureProvider<AppConfig>(
        child: Home(),
        lazy: false,
        create: (_) async => await AppConfig.forEnvironment('dev'),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Translations.of(context).title),
      ),
      body: Container(
        child: Center(
          child: Text('This is an boilerplate app'),
        ),
      ),
    );
  }
}
