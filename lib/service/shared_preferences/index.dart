import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static final shard = LocalStorage();

  SharedPreferences? _instance;
  SharedPreferences get pref => _instance!;

  Future<SharedPreferences> _getInstance() async {
    _instance ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  Future<void> setValue({
    required String key,
    required String value,
  }) async {
    if (_instance == null) {
      await _getInstance();
    }

    await pref.setString(key, value);
  }

  Future<String?> getValue({required String key}) async {
    if (_instance == null) {
      await _getInstance();
    }

    return pref.getString(key);
  }
}
