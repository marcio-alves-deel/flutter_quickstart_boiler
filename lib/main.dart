import 'package:flutter/material.dart';

void main() {
  runApp(FlutterBoilerApp());
}

class FlutterBoilerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Boilerplate App'),
        ),
        body: Container(
          child: Center(
            child: Text('This is an boilerplate app'),
          ),
        ),
      ),
    );
  }
}
