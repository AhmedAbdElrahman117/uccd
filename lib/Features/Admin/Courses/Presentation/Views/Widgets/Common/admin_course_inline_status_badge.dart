import 'package:flutter/material.dart';
import 'package:uccd/Core/app_color.dart';

/// Factory class for creating inline status badges for admin courses
class AdminCourseInlineStatusBadgeFactory {
  /// Create an available course status badge
  static Widget available({
    required EdgeInsets position,
  }) {
    return Builder(
      builder: (context) => Positioned(
        top: position.top,
        right: position.right,
        bottom: position.bottom,
        left: position.left,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 8.0,
          ),
          decoration: BoxDecoration(
            color: AppColor.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColor.primary.withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle,
                size: 14,
                color: AppColor.primary,
              ),
              SizedBox(width: 4),
              Text(
                'Available',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColor.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Create an archived course status badge
  static Widget archived({
    required EdgeInsets position,
  }) {
    return Builder(
      builder: (context) => Positioned(
        top: position.top,
        right: position.right,
        bottom: position.bottom,
        left: position.left,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 8.0,
          ),
          decoration: BoxDecoration(
            color: Colors.grey.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.grey.withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.archive,
                size: 14,
                color: Colors.grey.shade600,
              ),
              const SizedBox(width: 4),
              Text(
                'Archived',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
