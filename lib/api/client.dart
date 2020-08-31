import 'package:flutter/foundation.dart';
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

Future<Response> findAll() async {
  final Client client = HttpClientWithInterceptor.build(
    interceptors: [LoggingInterceptor()],
  );

  final Response response = await client.get('$_apiDomain/transactions');

  return response;
}
