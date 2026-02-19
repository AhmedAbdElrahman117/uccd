import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class EnhancedCoursesLoadingWidget extends StatelessWidget {
  const EnhancedCoursesLoadingWidget({
    super.key,
    this.message = 'Loading courses...',
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Loading Animation Container
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: isDarkMode
                  ? const Color(0xFF1E293B).withValues(alpha: 0.3)
                  : const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: isDarkMode
                    ? const Color(0xFF334155)
                    : const Color(0xFFE2E8F0),
                width: 1,
              ),
            ),
            child: LoadingAnimationWidget.threeArchedCircle(
              color: const Color(0xFF6366F1),
              size: 50,
            ),
          ),

          const SizedBox(height: 24),

          // Loading Text
          Text(
            message,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: isDarkMode
                  ? const Color(0xFF94A3B8)
                  : const Color(0xFF64748B),
              letterSpacing: 0.3,
            ),
          ),

          const SizedBox(height: 8),

          // Subtext
          Text(
            'Please wait while we fetch your content',
            style: TextStyle(
              fontSize: 14,
              color: isDarkMode
                  ? const Color(0xFF64748B)
                  : const Color(0xFF94A3B8),
            ),
          ),
        ],
      ),
    );
  }
}
