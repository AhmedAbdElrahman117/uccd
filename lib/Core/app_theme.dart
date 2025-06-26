import 'package:flutter/material.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        centerTitle: true,
        surfaceTintColor: Colors.white,
      ),
      cardColor: Colors.white,
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 16,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(color: Colors.white24),
        ),
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
      ),
      expansionTileTheme: ExpansionTileThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        childrenPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        iconColor: Colors.black,
      ),
      inputDecorationTheme: _textFieldLightTheme(context),
      iconTheme: const IconThemeData(color: Colors.black),
      iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
          iconColor: WidgetStatePropertyAll(Colors.black),
        ),
      ),
      shadowColor: Colors.black,
      textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(Colors.black),
          textStyle: WidgetStatePropertyAll(
            TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: _textFieldLightTheme(context),
        menuStyle: const MenuStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.white),
          elevation: WidgetStatePropertyAll(12),
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: 8),
          ),
          shadowColor: WidgetStatePropertyAll(Colors.black),
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        centerTitle: true,
        surfaceTintColor: Colors.black,
      ),
      iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
          iconColor: WidgetStatePropertyAll(Colors.white),
        ),
      ),
      brightness: Brightness.dark,
      // cardColor: Colors.black,
      expansionTileTheme: ExpansionTileThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        childrenPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        iconColor: Colors.white,
      ),
      // cardTheme: CardTheme(
      //   color: Colors.black,
      //   elevation: 20,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(15),
      //     side: const BorderSide(color: Colors.white24),
      //   ),
      //   surfaceTintColor: Colors.grey.shade700,
      //   shadowColor: Colors.grey.shade500,
      // ),
      inputDecorationTheme: _textFieldDarkTheme(context),
      iconTheme: const IconThemeData(color: Colors.white),
      shadowColor: Colors.white,
      textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(Colors.white),
          textStyle: WidgetStatePropertyAll(
            TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: _textFieldDarkTheme(context),
        menuStyle: const MenuStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.black),
          elevation: WidgetStatePropertyAll(12),
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: 8),
          ),
          shadowColor: WidgetStatePropertyAll(AppColor.primary),
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  static OutlineInputBorder _border({Color color = Colors.black}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(15),
    );
  }

  static InputDecorationTheme _textFieldLightTheme(BuildContext context) {
    return InputDecorationTheme(
      border: _border(),
      enabledBorder: _border(),
      focusedBorder: _border(color: Colors.green),
      errorBorder: _border(color: Colors.red),
      labelStyle: AppText.style14Bold(context).copyWith(
        color: Colors.black,
      ),
      hintFadeDuration: const Duration(milliseconds: 100),
      hintStyle: AppText.style14Bold(context).copyWith(
        color: Colors.grey.shade500,
      ),
      alignLabelWithHint: true,
    );
  }

  static InputDecorationTheme _textFieldDarkTheme(BuildContext context) {
    return InputDecorationTheme(
      border: _border(color: Colors.white),
      enabledBorder: _border(color: Colors.white),
      focusedBorder: _border(color: Colors.green),
      errorBorder: _border(color: Colors.red),
      labelStyle: AppText.style14Bold(context).copyWith(
        color: Colors.white,
      ),
      hintFadeDuration: const Duration(milliseconds: 100),
      hintStyle: AppText.style14Bold(context).copyWith(
        color: Colors.grey.shade500,
      ),
      alignLabelWithHint: true,
    );
  }
}
