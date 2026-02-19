import 'package:flutter/material.dart';
import 'package:uccd/Core/theme_helper.dart';
import 'package:uccd/main.dart';

class UserNameText extends StatelessWidget {
  final Color? textColor;

  const UserNameText({
    super.key,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        InternalStorage.getString('name'),
        style: ThemeHelper.style28Bold(context).copyWith(
          color: textColor ?? Colors.white,
          letterSpacing: 0.5,
          shadows: const [
            Shadow(
              color: Colors.black26,
              blurRadius: 2,
              offset: Offset(1, 1),
            ),
          ],
        ),
      ),
    );
  }
}
