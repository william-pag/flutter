import 'dart:convert';

import 'package:pag_flutter/query_string/mutation/mutation.dart';
import 'package:pag_flutter/config/http.dart';

class UserService {
  static final shared = UserService();

  void login(String email, String password) async {
    final String strLogin = loginMutation(email: email, password: password);
    final response = await HttpClient.shard.query(strLogin);
    final responseDecoded = jsonDecode(response);
    print([13, responseDecoded]);
  }
}