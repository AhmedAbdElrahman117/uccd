import 'package:flutter/material.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Categories/category_theme_helper.dart';

class CategoryActionButton extends StatelessWidget {
  const CategoryActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    required this.backgroundColor,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final Color color;
  final Color backgroundColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius:
            BorderRadius.circular(CategoryThemeHelper.actionButtonBorderRadius),
        child: AnimatedContainer(
          duration: CategoryThemeHelper.actionAnimationDuration,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(
                CategoryThemeHelper.actionButtonBorderRadius),
            border: Border.all(
              color: color.withAlpha(51),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: CategoryThemeHelper.actionIconSize,
                color: color,
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: CategoryThemeHelper.getActionButtonTextStyle(context)
                    .copyWith(
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
