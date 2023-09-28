import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguage = 'en';
  ThemeMode appTheme = ThemeMode.dark;

  // de function bt8yrly el language
  void changeLanguage(String newLanguage) {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    // de function 3amla zy el set state fe el statefulWidget
    notifyListeners();
  }

  // de function bt8yrly el theme
  void changeTheme(ThemeMode newMode) {
    if (appTheme == newMode) {
      return;
    }
    appTheme = newMode;
    notifyListeners();
  }

  // de function bt3ml check 3la el theme lw howa dark bdl ma aktb kol showya kda:
  // provider.((((((appTheme == ThemeMode.dark)))))) ? <<<<<<< bdl el 7eta de hbdlha bl function
  //           getSelectedItemWidget(AppLocalizations.of(context)!.dark)
  //               : getUnelectedItemWidget(AppLocalizations.of(context)!.dark)
  bool isDarkMode() {
    return appTheme == ThemeMode.dark;
  }
}
