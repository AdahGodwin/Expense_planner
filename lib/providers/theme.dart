import 'package:flutter/material.dart';
import '../db_helpers/db_helper.dart';

class ThemeChanger with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeChanger();

  // ThemeData? getTheme() => themeData;
  ThemeMode getThemeMode() {
    return _themeMode;
  }

  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  // Future<void> setTheme(String theme) async {
  //   if (themeData == null) {
  //     await DBHelper.insert("theme", {
  //       "themeData": theme,
  //     });
  //   } else {
  //     await DBHelper.update("theme", {
  //       "themeData": theme,
  //     });
  //   }

  //   notifyListeners();
  // }

  // Future<bool> getThemeData() async {
  //   final theme = await DBHelper.getData('theme');
  //   if (theme.isEmpty) {
  //     return false;
  //   }
  //   themeData = colors[theme[0]["themeData"]];
  //   notifyListeners();
  //   return true;
  // }
}
