import 'package:bytebank/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.grey[800],
        accentColor: Colors.green,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.green,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Dashboard(),
    );
  }
}
