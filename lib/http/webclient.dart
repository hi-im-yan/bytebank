import 'dart:io';

import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class Webclient {
  Client client = InterceptedClient.build(
    interceptors: [LoggingInterceptor()],
  );

  void findAll() async {
    final response =
        await client.get(Uri.http('192.168.0.19:8080', '/transactions'));
    print(response.body);
  }
}

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print('SENDING ${data.method} REQUEST');
    print('url: ${data.url}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print('REQUEST RESPONSE');
    print('status code: ${data.statusCode}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }
}
