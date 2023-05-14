import 'package:flutter/material.dart';
import '../db_helpers/db_helper.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData? themeData;

  ThemeChanger({this.themeData});

  ThemeData? getTheme() => themeData;
final Map<String, ThemeData> colors = {
    "Dark": ThemeData.dark(),
    "blue": ThemeData(
      primarySwatch: Colors.blue,
      fontFamily: 'Quicksand',
    ),
    "green": ThemeData(
      primarySwatch: Colors.green,
      fontFamily: 'Quicksand',
    ),
    "Teal": ThemeData(
      primarySwatch: Colors.teal,
      fontFamily: 'Quicksand',
    ),
    "Red": ThemeData(
      primarySwatch: Colors.red,
      fontFamily: 'Quicksand',
    ),
    "Orange": ThemeData(
      primarySwatch: Colors.orange,
      fontFamily: 'Quicksand',
    ),
  };
  Future<void> setTheme(String theme) async {
    if(themeData == null) {
      await DBHelper.insert("theme", {
      "themeData": theme,
    });
    }
    else {
      await DBHelper.update("theme", {
      "themeData": theme,
    });
    }
    
    notifyListeners();
  }

  
  Future<bool> getThemeData() async {
    final theme = await DBHelper.getData('theme');
     themeData = colors[theme[0]["themeData"]];
     notifyListeners();
    return true;
  }
}
