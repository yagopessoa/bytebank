import 'package:bytebank/screens/transfers/list.dart';
import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TransfersList(),
      theme: ThemeData(
        primaryColor: Colors.blueGrey[700],
        accentColor: Colors.tealAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.tealAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
    );
  }
}
