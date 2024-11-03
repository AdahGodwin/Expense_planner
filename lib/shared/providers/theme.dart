import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../db_helpers/db_helper.dart';

class ThemeChangerNotifier extends StateNotifier<bool> {
  ThemeChangerNotifier() : super(true);

  void toggleTheme() {
    state = !state;
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

final themeProvider = StateNotifierProvider<ThemeChangerNotifier, bool>((ref) {
  return ThemeChangerNotifier();
});
