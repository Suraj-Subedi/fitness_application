import 'package:shared_preferences/shared_preferences.dart';

class MemoryManagement {
  static SharedPreferences? prefs;
  static Future<bool> init() async {
    prefs = await SharedPreferences.getInstance();
    return true;
  }

  static setLoginData({required String accessToken}) async {
    await setAccessToken(accessToken: accessToken);
    await setLoginStatus(status: true);
  }

  static setAccessToken({required String accessToken}) async {
    return await prefs!.setString(SharedPrefsKeys.ACCESS_TOKEN, accessToken);
  }

  static void removeAccessToken() async {
    await prefs!.remove(SharedPrefsKeys.ACCESS_TOKEN);
  }

  static String? getAccessToken() {
    return prefs != null
        ? prefs!.getString(SharedPrefsKeys.ACCESS_TOKEN)
        : null;
  }

  static setLoginStatus({
    required bool status,
  }) {
    return prefs!.setBool(SharedPrefsKeys.LOGIN_STATUS, status);
  }

  static bool getLoginStatus() {
    try {
      return prefs!.getBool(SharedPrefsKeys.LOGIN_STATUS)!;
    } catch (e) {
      return false;
    }
  }

  static Future<void> clearMemory() async {
    await prefs!.clear();
  }

  static Future<void> logOut() async {
    removeAccessToken();
    setLoginStatus(status: false);
  }
}

class SharedPrefsKeys {
// ignore: constant_identifier_names
  static const String ACCESS_TOKEN = 'access_token';
// ignore: constant_identifier_names
  static const String LOGIN_STATUS = 'login_status';
// ignore: constant_identifier_names
}
