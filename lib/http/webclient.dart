import 'dart:convert';

import 'package:bytebank/models/contato.dart';
import 'package:bytebank/models/transaction.dart' as model;
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:sqflite/sqflite.dart';

class Webclient {
  Client client = InterceptedClient.build(
    interceptors: [LoggingInterceptor()],
  );

  Future<List<model.Transaction>> findAll() async {
    final response =
        await client.get(Uri.http('192.168.0.19:8080', '/transactions')).timeout(Duration(seconds: 5));

    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<model.Transaction> transactions = [];

    for (Map<String, dynamic> element in decodedJson) {
      final model.Transaction transaction = model.Transaction(
          element['value'],
          Contato(
            0,
            element['contact']['name'],
            element['contact']['accountNumber'],
          ));
      transactions.add(transaction);
    }
    return transactions;
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
