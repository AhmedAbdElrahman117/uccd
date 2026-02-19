import 'package:flutter/material.dart';
import 'package:uccd/Core/theme_helper.dart';

class CourseStatItem extends StatelessWidget {
  const CourseStatItem({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: ThemeHelper.appPrimaryColor.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: ThemeHelper.appPrimaryColor,
          ),
        ),
        const SizedBox(height: 8),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            value,
            style: ThemeHelper.style14Bold(context),
          ),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            label,
            style: ThemeHelper.style12Regular(context).copyWith(
              color: ThemeHelper.getAdaptiveColor(
                context,
                lightColor: Colors.grey[600]!,
                darkColor: Colors.grey[400]!,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
