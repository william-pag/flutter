import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pag_flutter/model/model.dart';

class HttpClient {
  static final shard = HttpClient();
  String token = '';
  final String _urlStr = 'http://103.81.85.228:5000/graphql';

  Future<ResponseType> query(String str) async {
    final data = await http.post(
      Uri.parse(_urlStr),
      body: {
        'query': str,
      },
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    final response = jsonDecode(data.body);
    if (response['errors'] != null) {
      final error = ErrorResponse.fromJson(response);
      return ResponseType(hasError: true, error: error);
    } else {
      return ResponseType(hasError: false, data: response);
    }
  }
}

class ResponseType {
  bool hasError;
  Map<String, dynamic> data;
  ErrorResponse? error;
  ResponseType(
      {required this.hasError,
      this.data = const <String, dynamic>{},
      this.error});
}
