import 'package:flutter/material.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';

class AdaptiveCard extends StatelessWidget {
  const AdaptiveCard({
    super.key,
    required this.title,
    this.subtitle,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.onTap,
    this.elevation = 2,
    this.borderRadius = 12,
    this.headerIcon,
    this.actionIcon,
    this.actionOnTap,
  });

  final String title;
  final String? subtitle;
  final Widget child;
  final EdgeInsets padding;
  final VoidCallback? onTap;
  final double elevation;
  final double borderRadius;
  final IconData? headerIcon;
  final IconData? actionIcon;
  final VoidCallback? actionOnTap;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDarkMode ? const Color(0xFF252525) : Colors.white;
    final borderColor =
        isDarkMode ? const Color(0xFF3D3D3D) : const Color(0xFFEAEAEA);
    final textColor = isDarkMode ? Colors.white : Colors.black87;
    final secondaryTextColor = isDarkMode ? Colors.white70 : Colors.black54;

    return Card(
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: BorderSide(
          color: borderColor,
          width: 1,
        ),
      ),
      color: cardColor,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card header
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  if (headerIcon != null) ...[
                    Icon(
                      headerIcon,
                      color: AppColor.primary,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                  ],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: AppText.style16Bold(context).copyWith(
                            color: textColor,
                          ),
                        ),
                        if (subtitle != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            subtitle!,
                            style: AppText.style14Regular(context).copyWith(
                              color: secondaryTextColor,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (actionIcon != null)
                    IconButton(
                      icon: Icon(
                        actionIcon,
                        color: AppColor.primary,
                        size: 20,
                      ),
                      onPressed: actionOnTap,
                    ),
                ],
              ),
            ),

            // Divider
            Divider(
              height: 1,
              thickness: 1,
              color: borderColor,
            ),

            // Card content
            Padding(
              padding: padding,
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
