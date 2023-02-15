import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  SharedPreferences? sharedPreferences;
  static Future<void> setPreferences(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<String?> getPreferences(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}
