import 'package:flutter/material.dart';
import 'package:flutter_chatgpt_chatapp/constant/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyThemeProvider extends ChangeNotifier {
  bool _isdarkTheme = false;
  bool get themeType => _isdarkTheme;

  set setTheme(bool value) {
    _isdarkTheme = value;
    saveThemeToSahredPreferences(value: value);
    notifyListeners();
  }

  void saveThemeToSahredPreferences({required bool value}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool(Constants.themeStatus, value);
  }

  getThemeStatus() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    _isdarkTheme = sharedPreferences.getBool(Constants.themeStatus) ?? false;
    notifyListeners();
  }
}
