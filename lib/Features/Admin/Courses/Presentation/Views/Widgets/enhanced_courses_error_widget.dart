import 'package:flutter/material.dart';
import 'package:uccd/generated/l10n.dart';

class EnhancedCoursesErrorWidget extends StatelessWidget {
  const EnhancedCoursesErrorWidget({
    super.key,
    this.message,
    this.onRetry,
  });

  final String? message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Error Icon Container
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: isDarkMode
                  ? const Color(0xFF1E293B).withValues(alpha: 0.5)
                  : const Color(0xFFFEF2F2),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: isDarkMode
                    ? const Color(0xFF7F1D1D)
                    : const Color(0xFFFECACA),
                width: 1,
              ),
            ),
            child: Icon(
              Icons.error_outline_rounded,
              size: 64,
              color: isDarkMode
                  ? const Color(0xFFEF4444)
                  : const Color(0xFFDC2626),
            ),
          ),

          const SizedBox(height: 24),

          // Error Title
          Text(
            'Oops! Something went wrong',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : const Color(0xFF1E293B),
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 12),

          // Error Message
          SelectableText(
            message ?? S.of(context).failedToLoadCoursesWithHelp,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: isDarkMode
                  ? const Color(0xFF94A3B8)
                  : const Color(0xFF64748B),
              height: 1.5,
            ),
          ),

          if (onRetry != null) ...[
            const SizedBox(height: 32),

            // Retry Button
            ElevatedButton.icon(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6366F1),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
                shadowColor: Colors.transparent,
              ).copyWith(
                backgroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.pressed)) {
                    return const Color(0xFF4F46E5);
                  }
                  return const Color(0xFF6366F1);
                }),
              ),
              icon: const Icon(
                Icons.refresh_rounded,
                size: 20,
              ),
              label: const Text(
                'Try Again',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
