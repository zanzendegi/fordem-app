import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static Future<SharedPreferences> get _instance =>
      SharedPreferences.getInstance();

  static Future<String?> getString(String key) async {
    final i = await _instance;

    return i.getString(key);
  }

  static Future<bool?> setString(String key, String value) async {
    final i = await _instance;

    return i.setString(key, value);
  }

  static Future<bool?> remove(String key) async {
    final i = await _instance;

    return i.remove(key);
  }
}
