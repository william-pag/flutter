import 'dart:convert';

import 'package:pag_flutter/model/model.dart';
import 'package:pag_flutter/query_string/mutation/mutation.dart';
import 'package:pag_flutter/config/http.dart';

class UserService {
  static final shared = UserService();

  Future<String> login({required String email, required String password}) async {
    final String strLogin = loginMutation(email: email, password: password);
    final response = await HttpClient.shard.query(strLogin);
    final responseDecoded = jsonDecode(response);
    final loginToken = LoginModel.fromJson(responseDecoded);
    print([13, loginToken.data.login.accessToken]);
    return loginToken.data.login.accessToken;
  }
}