import 'package:flutter/material.dart';

void main() {
  // runApp(MyApp());
  runApp(
    Column(
      children: <Widget>[
        Text(
          '\n\nBem vindo ao ByteBank',
          textDirection: TextDirection.ltr,
        ),
        Text(
          '\n\nUm app de gerenciamento de transações',
          textDirection: TextDirection.ltr,
        ),
        Column(
          children: [
            Text(
              '\n\nEnjoy!',
              textDirection: TextDirection.ltr,
            ),
          ],
        )
      ],
    ),
  );
}
