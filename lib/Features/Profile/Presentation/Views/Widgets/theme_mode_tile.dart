import 'package:flutter/material.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Core/notifier.dart';

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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: SwitchListTile(
        value: isDark,
        activeTrackColor: AppColor.primary,
        secondary: Icon(
          Icons.dark_mode_outlined,
          size: 24,
          color: Theme.of(context).iconTheme.color,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: Text(
          'Dark Mode',
          style: AppText.style14Bold(context),
        ),
        onChanged: (value) {
          setState(() {
            isDark = value;
            Notifier.changeTheme(isDark);
          });
        },
      ),
    );
  }
}
