import 'package:flutter/material.dart';
import 'package:uccd/Core/app_color.dart';

class RateViewHeader extends StatelessWidget {
  const RateViewHeader({
    super.key,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        Icon(
          icon,
          color: AppColor.primary,
          size: 20,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ],
    );
  }
}
