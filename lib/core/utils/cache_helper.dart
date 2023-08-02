import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheHelper {
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static dynamic getData({required String key}) {
    return sharedPreferences?.get(key);
  }

  static Future<bool> saveString(
      {required String key, required bool value}) async {
    return await sharedPreferences!.setBool(key, value);
  }

  static Future<bool> savebool(
      {required String key, required String value}) async {
    return await sharedPreferences!.setString(key, value);
  }

  static Future<bool> saveint({required String key, required int value}) async {
    return await sharedPreferences!.setInt(key, value);
  }

  static Future<bool> removeData({required String key}) async {
    return await sharedPreferences!.remove(key);
  }
}
