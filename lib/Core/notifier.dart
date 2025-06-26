import 'package:flutter/material.dart';

class Notifier {
  Notifier._();
  static final ValueNotifier<bool> termsAgreeNotifier =
      ValueNotifier<bool>(false);
  static final ValueNotifier<DateTime?> graduationYearPickerNotifier =
      ValueNotifier<DateTime?>(null);

  static final ValueNotifier<ThemeMode> theme =
      ValueNotifier<ThemeMode>(ThemeMode.system);

  static void triggerTermsAgree() {
    termsAgreeNotifier.value = !termsAgreeNotifier.value;
  }

  static void selectGraduationDate(DateTime date) {
    graduationYearPickerNotifier.value = date;
  }

  static void changeTheme(bool isDark) {
    if (!isDark) {
      theme.value = ThemeMode.light;
    } else {
      theme.value = ThemeMode.dark;
    }
  }
}
