import 'dart:io';

import 'package:http/http.dart' as http;

class HttpClient {
  static final shard = HttpClient();
  String _token = '';


  String get token => _token;

  set token(String value) => _token = value;

  Future<String> query(String str) async {
    final data = await http.post(Uri.parse(str), headers: {
      HttpHeaders.authorizationHeader: 'Bearer $token',
    });
    return data.body;
  }
}