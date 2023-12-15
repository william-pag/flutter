import 'package:pag_flutter/bloc/bloc.dart';
import 'package:pag_flutter/config/config.dart';
import 'package:pag_flutter/model/model.dart';
import 'package:pag_flutter/query_string/mutation/mutation.dart';
import 'package:pag_flutter/query_string/query/query.dart';
import 'package:pag_flutter/service/shared_preferences/index.dart';

class UserService {
  static final shared = UserService();

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    final String strLogin = loginStr(email: email, password: password);
    final response = await HttpClient.shard.query(strLogin);
    if (response.hasError) {
      return false;
    } else {
      final loginToken = LoginModel.fromJson(response.data);
      final token = loginToken.data.login.accessToken;
      HttpClient.shard.token = token;
      TokenState(isAuthorized: true, token: token, status: Progress.loaded);
      await LocalStorage.shard.setValue(key: 'token', value: token);
      return true;
    }
  }

  Future<ResponseDAO<MeClass>> me() async {
    final String strLogin = meStr();
    final response = await HttpClient.shard.query(strLogin);
    if (response.hasError) {
      HttpClient.shard.token = '';
      await LocalStorage.shard.removeValue(key: 'token');
      return ResponseDAO(hasError: true, error: response.error);
    } else {
      final data = MeModel.fromJson(response.data).data.me;
      return ResponseDAO(hasError: false, data: data);
    }
  }

  Future<ResponseDAO<List<UserModel>>> getAllUsers({
    required String token,
  }) async {
    final String strUsers = getAllUsersStr();
    HttpClient.shard.token = token;
    final response = await HttpClient.shard.query(strUsers);
    if (response.hasError) {
      return ResponseDAO(hasError: true, error: response.error);
    } else {
      final users = List<UserModel>.from(
        UsersModel.fromJson(
          response.data,
        ).data.getAllUsers,
      )..insert(
          0,
          UserModel(id: 0, name: 'All'),
        );
      return ResponseDAO(hasError: false, data: users);
    }
  }
}
