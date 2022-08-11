import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? shared;
  static Future init() async {
    shared = await SharedPreferences.getInstance();
  }

  static bool getBool({required String key}) {
    return shared!.getBool(key)!;
  }

  static Future<bool> setBool({required String key, required bool value}) {
    return shared!.setBool(key, value);
  }

  static String getString({required String key}) {
    return shared!.getString(key)!;
  }

  static Future<bool> setString({required String key, required String value}) {
    return shared!.setString(key, value);
  }
}
