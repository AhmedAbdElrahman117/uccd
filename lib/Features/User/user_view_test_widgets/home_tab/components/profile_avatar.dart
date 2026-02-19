import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:uccd/Core/theme_helper.dart';
import 'package:uccd/main.dart';

class ProfileAvatar extends StatelessWidget {
  final VoidCallback? onTap;
  final double size;
  final Color? textColor;

  const ProfileAvatar({
    super.key,
    this.onTap,
    this.size = 70,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.white70,
            ],
          ),
          border: Border.all(
            color: Colors.white,
            width: 3,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(51),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            _getInitials(),
            style: ThemeHelper.style22Bold(context).copyWith(
              color: textColor ?? ThemeHelper.appPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }

  String _getInitials() {
    final nameParts = InternalStorage.getString('name').split(' ');
    if (nameParts.length >= 2) {
      return nameParts[0][0].toUpperCase();
    } else if (nameParts.isNotEmpty) {
      return nameParts[0]
          .substring(0, math.min(nameParts[0].length, 1))
          .toUpperCase();
    }
    return 'U';
  }
}
