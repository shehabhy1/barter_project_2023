import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheHelper {
  static SharedPreferences? storingSharedPreferences;
  static init() async {
    storingSharedPreferences = await SharedPreferences.getInstance();
  }

  static dynamic getData({required String key}) {
    return storingSharedPreferences?.get(key);
  }

  static String getStringData({required String key}) {
    return storingSharedPreferences!.getString(key) ?? '';
  }

  static Future<bool> saveString(
      {required String key, required String value}) async {
    return await storingSharedPreferences!.setString(key, value);
  }

  static Future<bool> savebool(
      {required String key, required bool value}) async {
    return await storingSharedPreferences!.setBool(key, value);
  }

  static Future<bool> saveint({required String key, required int value}) async {
    return await storingSharedPreferences!.setInt(key, value);
  }

  static Future<bool> removeData({required String key}) async {
    return await storingSharedPreferences!.remove(key);
  }
}
