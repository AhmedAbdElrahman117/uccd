import 'package:flutter/material.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/main.dart';

class UserLogo extends StatelessWidget {
  const UserLogo({
    super.key,
    this.radius,
    this.backgroundColor,
  });

  final double? radius;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final userName = InternalStorage.getString('name').isNotEmpty
        ? InternalStorage.getString('name')
        : 'Admin';
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: backgroundColor?.withAlpha(200) ??
              Colors.white.withAlpha(77), // 30% opacity
          width: 2,
        ),
      ),
      child: CircleAvatar(
        radius: radius ?? 22,
        backgroundColor: backgroundColor?.withAlpha(180) ??
            Colors.white.withAlpha(51), // 20% opacity
        child: Text(
          userName.isNotEmpty ? userName[0].toUpperCase() : 'A',
          style: AppText.style16Bold(context).copyWith(
            color: Colors.white,
            fontSize: radius != null ? radius! - 15 : null,
          ),
        ),
      ),
    );
  }
}
