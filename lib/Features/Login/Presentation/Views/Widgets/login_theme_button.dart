import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uccd/Core/utils_provider.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/login_theme_helper.dart';

class LoginThemeButton extends StatelessWidget {
  const LoginThemeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Switch(
        value: LoginThemeHelper.isDark(context),
        onChanged: (value) async {
          Provider.of<UtilsProvider>(context, listen: false).changeThemeMode();
        },
        thumbIcon: WidgetStateProperty.resolveWith<Icon?>((states) {
          if (states.contains(WidgetState.selected)) {
            return const Icon(
              Icons.dark_mode,
              color: Colors.white,
              size: 18,
            );
          }
          return const Icon(
            Icons.light_mode,
            color: Colors.white,
            size: 18,
          );
        }),
        activeColor: Colors.grey.shade800,
        inactiveThumbColor: Colors.amber,
        inactiveTrackColor: Colors.amber.withValues(alpha: 0.3),
        activeTrackColor: Colors.grey.withValues(alpha: 0.3),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}
