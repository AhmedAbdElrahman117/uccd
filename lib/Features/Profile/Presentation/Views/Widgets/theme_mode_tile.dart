import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Core/utils_provider.dart';
import 'package:uccd/generated/l10n.dart';

class ThemeModeTile extends StatefulWidget {
  const ThemeModeTile({
    super.key,
  });

  @override
  State<ThemeModeTile> createState() => _ThemeModeTileState();
}

class _ThemeModeTileState extends State<ThemeModeTile> {
  bool isDark = false;

  @override
  void initState() {
    isDark = currentThemeMode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final tileColor = isDarkMode ? const Color(0xFF2A2A2A) : Colors.white;
    final borderColor =
        isDarkMode ? const Color(0xFF3D3D3D) : const Color(0xFFEAEAEA);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          color: tileColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor),
          boxShadow: [
            BoxShadow(
              color: isDarkMode
                  ? Colors.black.withValues(alpha: 0.1)
                  : Colors.black.withValues(alpha: 0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              // Icon with background
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color:
                      Theme.of(context).iconTheme.color?.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.dark_mode_outlined,
                  size: 20,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),

              const SizedBox(width: 16), // Title
              Expanded(
                child: Text(
                  S.of(context).darkMode,
                  style: AppText.style14Bold(context),
                ),
              ),

              // Switch
              Switch(
                value: isDark,
                activeColor: AppColor.primary,
                onChanged: (value) {
                  context.read<UtilsProvider>().changeThemeMode();
                  isDark = currentThemeMode();
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool currentThemeMode() {
    final themeMode = context.read<UtilsProvider>().getThemeMode;
    if (themeMode == ThemeMode.dark) {
      isDark = true;
    } else {
      isDark = false;
    }
    return isDark;
  }
}
