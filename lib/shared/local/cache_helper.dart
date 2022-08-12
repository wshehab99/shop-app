import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? shared;
  static Future init() async {
    shared = await SharedPreferences.getInstance();
  }

  static Future getData({required String key}) async {
    return shared!.get(key);
  }

  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is String) {
      return await shared!.setString(key, value);
    } else if (value is bool) {
      return await shared!.setBool(key, value);
    } else if (value is double) {
      return await shared!.setDouble(key, value);
    } else {
      return await shared!.setInt(key, value);
    }
  }
}
