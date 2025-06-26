import 'package:flutter/material.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({
    super.key,
    required this.title,
    this.actions,
    this.showBackButton = true,
  });

  final String title;
  final List<Widget>? actions;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? const Color(0xFF1A1A1A) : Colors.white;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: isDarkMode
                ? Colors.black12
                : Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          if (showBackButton)
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColor.primary,
                size: 20,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          Expanded(
            child: Text(
              title,
              style: AppText.style18Bold(context).copyWith(
                color: AppColor.primary,
              ),
              textAlign: showBackButton ? TextAlign.start : TextAlign.center,
            ),
          ),
          if (actions != null) ...actions!,
        ],
      ),
    );
  }
}
