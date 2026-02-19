import 'package:flutter/material.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';

class AdminCourseStatusBadge extends StatelessWidget {
  const AdminCourseStatusBadge({
    super.key,
    required this.status,
    this.isArchived = false,
  });

  final String status;
  final bool isArchived;
  @override
  Widget build(BuildContext context) {
    final Color statusColor = isArchived ? Colors.grey[600]! : AppColor.primary;

    final Color backgroundColor = isArchived
        ? Colors.grey[100]!
        : AppColor.primary.withValues(
            alpha: 0.1,
          );

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 4.0,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: statusColor,
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: statusColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            status,
            style: AppText.style12Bold(context).copyWith(
              color: statusColor,
            ),
          ),
        ],
      ),
    );
  }
}
