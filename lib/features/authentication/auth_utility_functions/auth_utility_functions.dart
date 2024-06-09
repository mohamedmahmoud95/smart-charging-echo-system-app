import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthUtilityFunctions {
  static Future<String> authenticationGateRouter() async {
    bool hasAccessToken = await _hasAccessToken();

    if (hasAccessToken) {
      return "home_screen_route";
    } else {
      return  "sign_in_screen_route";
    }
  }

  static Future<void> resetStorage() async {
    AndroidOptions getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );
    final securedStorage = FlutterSecureStorage(aOptions: getAndroidOptions());
    await securedStorage.deleteAll();
  }

  //-----------------------------------------------------------//
  // Access Token Functions
  static Future<String?> getAccessToken() async {
    AndroidOptions getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );
    final securedStorage = FlutterSecureStorage(aOptions: getAndroidOptions());
    return securedStorage.read(key: 'access_token');
  }

  static Future<bool> _hasAccessToken() async {
    String? accessToken = await getAccessToken();
    return accessToken != null && accessToken.isNotEmpty;
  }

  static Future<void> setAccessToken(String accessToken) async {
    AndroidOptions getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );
    final securedStorage = FlutterSecureStorage(aOptions: getAndroidOptions());
    await securedStorage.write(key: 'access_token', value: accessToken);
  }

  static Future<void> resetAccessToken() async {
    // debugPrint("access token reset to an empty string");
    AndroidOptions getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );
    final securedStorage = FlutterSecureStorage(aOptions: getAndroidOptions());
    await securedStorage.write(key: 'access_token', value: '');
    // debugPrint("access token reset to an empty string");
  }
//-----------------------------------------------------------//
}
