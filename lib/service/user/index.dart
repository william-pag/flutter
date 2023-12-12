import 'package:pag_flutter/model/model.dart';
import 'package:pag_flutter/query_string/mutation/mutation.dart';
import 'package:pag_flutter/config/http.dart';
import 'package:pag_flutter/service/shared_preferences/index.dart';

class UserService {
  static final shared = UserService();

  Future<String> login({
    required String email,
    required String password,
  }) async {
    final String strLogin = loginStr(email: email, password: password);
    final response = await HttpClient.shard.query(strLogin);
    if (response.hasError) {
      return '';
    } else {
      final loginToken = LoginModel.fromJson(response.data);
      final token = loginToken.data.login.accessToken;
      HttpClient.shard.token = token;
      LocalStorage.shard.setValue(key: 'token', value: token);
      return token;
    }
  }
}
