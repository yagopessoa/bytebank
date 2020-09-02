import 'dart:convert';

import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

const _apiDomain = 'http://192.168.15.32:3000';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print('Request:');
    print('url: ${data.baseUrl}');
    print('headers: ${data.headers}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print('Response:');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }
}

Future<List<Transaction>> findAll() async {
  final Client client = HttpClientWithInterceptor.build(
    interceptors: [LoggingInterceptor()],
  );

  try {
    final Response response = await client
        .get('$_apiDomain/transactions')
        .timeout(Duration(seconds: 5));

    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<Transaction> transactions = List();

    for (Map<String, dynamic> transactionJson in decodedJson) {
      final Map<String, dynamic> contactJson = transactionJson['contact'];
      final Transaction transaction = Transaction(
        double.tryParse(transactionJson['value'].toString()),
        Contact(
          0,
          contactJson['name'],
          contactJson['accountNumber'],
        ),
      );
      transactions.add(transaction);
    }

    return transactions;
  } catch (err) {
    print('Caught error: $err');
    return null;
  }
}
