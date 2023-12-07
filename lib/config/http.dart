import 'dart:io';

import 'package:http/http.dart' as http;

class HttpClient {
  static final shard = HttpClient();
  String _token = '';
  final String urlStr = 'http://103.81.85.228:5000/graphql';

  set token(String value) => _token = value;

  Future<String> query(String str) async {
    final data = await http.post(
      Uri.parse(urlStr),
      body: {
        'query': str,
      },
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $_token',
      },
    );
    return data.body;
  }
}
