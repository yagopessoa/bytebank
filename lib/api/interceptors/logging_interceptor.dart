import 'package:http_interceptor/interceptor_contract.dart';
import 'package:http_interceptor/models/models.dart';

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
