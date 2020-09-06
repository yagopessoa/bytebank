import 'dart:convert';

import 'package:bytebank/api/client.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';

const _apiDomain = 'http://192.168.15.32:3000';
const _apiRoute = '/transactions';

class TransactionClient {
  Future<List<Transaction>> findAll() async {
    try {
      final Response response = await client
          .get('$_apiDomain$_apiRoute')
          .timeout(Duration(seconds: 5));

      final List<dynamic> decodedJson = jsonDecode(response.body);

      return decodedJson
          .map((dynamic json) => Transaction.fromJson(json))
          .toList();
    } catch (err) {
      print('Caught error: $err');
      return null;
    }
  }

  Future<Transaction> save(Transaction transaction) async {
    try {
      final String transactionJson = jsonEncode(transaction.toJson());

      final Response response = await client
          .post(
            '$_apiDomain$_apiRoute',
            headers: {'Content-type': 'application/json'},
            body: transactionJson,
          )
          .timeout(Duration(seconds: 5));

      return Transaction.fromJson(jsonDecode(response.body));
    } catch (err) {
      print('Caught error: $err');
      return null;
    }
  }
}
