import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:uccd/main.dart';

class UtilsProvider extends ChangeNotifier {
  Locale? locale;
  ThemeMode? themeMode;
  UtilsProvider() {
    checkThemeMode();
    checkLocale();
  }

  Locale get getLocale => locale ?? const Locale('en', 'US');
  ThemeMode get getThemeMode => themeMode ?? ThemeMode.system;

  void changeThemeMode() {
    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
    } else if (themeMode == ThemeMode.dark) {
      themeMode = ThemeMode.light;
    }
    InternalStorage.setString(
      'ThemeMode',
      themeMode.toString().split('.').last,
    );
    notifyListeners();
  }

  void changeLocale(String languageCode) async {
    String countryCode = '';
    if (languageCode == 'ar') {
      countryCode = 'EG';
      locale = Locale(languageCode, countryCode);
    } else if (languageCode == 'ko') {
      countryCode = 'KR';
      locale = Locale(languageCode, countryCode);
    } else {
      locale = Locale('en', 'US');
    }
    await Jiffy.setLocale(locale!.languageCode);
    InternalStorage.setString(
      'Local',
      languageCode,
    );
    notifyListeners();
  }

  void checkThemeMode() {
    if (InternalStorage.getString('ThemeMode').isNotEmpty) {
      if (InternalStorage.getString('ThemeMode') == 'dark') {
        themeMode = ThemeMode.dark;
      } else if (InternalStorage.getString('ThemeMode') == 'light') {
        themeMode = ThemeMode.light;
      }
    } else {
      PlatformDispatcher.instance.platformBrightness == Brightness.dark
          ? themeMode = ThemeMode.dark
          : themeMode = ThemeMode.light;
      InternalStorage.setString(
        'ThemeMode',
        themeMode.toString().split('.').last,
      );
    }
    notifyListeners();
  }

  void checkLocale() {
    if (InternalStorage.getString('Local').isNotEmpty) {
      if (InternalStorage.getString('Local') == 'ar') {
        locale = const Locale('ar', 'EG');
      } else if (InternalStorage.getString('Local') == 'en') {
        locale = const Locale('en', 'US');
      } else if (InternalStorage.getString('Local') == 'ko') {
        locale = const Locale('ko', 'KR');
      }
    } else {
      PlatformDispatcher.instance.locale.languageCode == 'ar'
          ? locale = const Locale('ar', 'EG')
          : PlatformDispatcher.instance.locale.languageCode == 'ko'
              ? locale = const Locale('ko', 'KR')
              : locale = const Locale('en', 'US');
      InternalStorage.setString(
        'Local',
        locale!.languageCode,
      );
    }

    notifyListeners();
  }
}
