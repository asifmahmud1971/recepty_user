import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:receptyUser/features/screens/auth/models/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_dependency.dart';

const String prefsKeyLang = "prefsKeyLang";
const String prefsKeyIntroScreen = "prefsKeyIntroScreen";
const String prefsKeyIsUserLoggedIn = "prefsKeyIsUserLoggedIn";
const String prefsKeyUserLanguage = "prefsKeyUserLanguage";
const String prefsKeyAppDarkTheme = "prefsKeyAppDarkTheme";

const String prefsKeyUserId = "prefsKeyUserId";
const String prefsKeyEmployeeNumber = "prefsKeyEmployeeNumber";
const String prefsKeyCompanyId = "prefsKeyCompanyId";
const String prefsKeyUserMedium = "prefsKeyUserMedium";
const String prefsKeyUserToken = "prefsKeyUserToken";
const String prefsKeyDeviceToken = "prefsKeyDeviceToken";
const String prefsKeyUserName = "prefsKeyUserName";
const String prefsKeyUserImage = "prefsKeyUserImage";
const String prefsKeyUserEmail = "prefsKeyUserEmail";
const String prefsKeyUserPhone = "prefsKeyUserPhone";
const String prefsKeyUserFullPhone = "prefsKeyUserFullPhone";
const String prefsKeyUserType = "prefsKeyUserType";
const String prefsUserData = "prefsUserData";

@injectable
class AppPreferences {
  final _sharedPreferences = instance<SharedPreferences>();

  /// set preferences data start here ///

  Future<void> saveUserData(LoginResponse userData) async {
    _sharedPreferences.setString(prefsUserData, json.encode(userData));
  }

  Future<void> updateUserData(dynamic data) async {
    _sharedPreferences.setString(prefsKeyUserName, data.data?.name ?? '');
  }

  Future<void> setFCMToken(String? token) async {
    _sharedPreferences.setString(prefsKeyDeviceToken, token ?? '');
  }

  Future<void> setLanguage(String? language) async {
    _sharedPreferences.setString(prefsKeyUserLanguage, language ?? 'English');
  }

  Future<void> setAppDarkTheme() async {
    _sharedPreferences.setBool(prefsKeyAppDarkTheme, true);
  }

  Future<void> setIsUserLoggedIn() async {
    _sharedPreferences.setBool(prefsKeyIsUserLoggedIn, true);
  }

  Future<void> setIntroScreenCompleted() async {
    _sharedPreferences.setBool(prefsKeyIntroScreen, true);
  }

  Future<void> setAppLightTheme() async {
    _sharedPreferences.setBool(prefsKeyAppDarkTheme, false);
  }

  Future<void> setUserToken(String? accessToken) async {
    _sharedPreferences.setString(prefsKeyUserToken, accessToken ?? '');
  }

  Future<void> removeUserData() async {}

  /// set preferences data end here ///

  /// get preferences data start here ///
  LoginResponse? getUserData() {
    if (_sharedPreferences.containsKey(prefsUserData)) {
      return LoginResponse.fromJson(
          json.decode(_sharedPreferences.getString(prefsUserData)!));
    } else {
      return null;
    }
  }

  Future<String> getUserToken() async {
    return _sharedPreferences.getString(prefsKeyUserToken) ?? "";
  }

  Future<String> getDeviceToken() async {
    return _sharedPreferences.getString(prefsKeyDeviceToken) ?? "";
  }

  Future<int> getUserID() async {
    return _sharedPreferences.getInt(prefsKeyEmployeeNumber) ?? -1;
  }

  bool getIntroScreenStatus() {
    return _sharedPreferences.getBool(prefsKeyIntroScreen) ?? false;
  }

  String getLanguage() {
    return _sharedPreferences.getString(prefsKeyUserLanguage) ?? 'English';
  }

  bool getIsAppDarkTheme() {
    return true;
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(prefsKeyIsUserLoggedIn) ?? false;
  }

  Future<void> logout() async {
    await removeUserData();
    _sharedPreferences.remove(prefsKeyIsUserLoggedIn);
  }

/// get preferences data end here ///
}
