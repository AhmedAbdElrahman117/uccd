import 'package:flutter/material.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/generated/l10n.dart';

class CommunityHeader extends StatelessWidget {
  const CommunityHeader({
    super.key,
    required this.isDarkMode,
    required this.textColor,
  });

  final bool isDarkMode;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      color: isDarkMode
          ? const Color(0xFF252525).withAlpha(100)
          : Colors.white.withAlpha(100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).communityTitle,
            style: AppText.style20Bold(context).copyWith(
              color: textColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            S.of(context).communitySubtitle,
            style: AppText.style14Regular(context).copyWith(
              color: textColor.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }
}
