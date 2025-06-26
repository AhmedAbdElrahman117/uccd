import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/add_course_view.dart';

class EnhancedEmptyCoursesWidget extends StatelessWidget {
  const EnhancedEmptyCoursesWidget({
    super.key,
    this.message = 'No courses created yet',
    this.showCreateButton = true,
  });

  final String message;
  final bool showCreateButton;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Animated Container for the image
          AnimatedContainer(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeOutBack,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: isDarkMode
                    ? const Color(0xFF1E293B).withValues(alpha: 0.5)
                    : const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: isDarkMode
                      ? const Color(0xFF334155)
                      : const Color(0xFFE2E8F0),
                  width: 1,
                ),
              ),
              child: Icon(
                Icons.school_outlined,
                size: 80,
                color: isDarkMode
                    ? const Color(0xFF64748B)
                    : const Color(0xFF94A3B8),
              ),
            ),
          ),

          const SizedBox(height: 32),

          // Title
          Text(
            'No Courses Yet',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : const Color(0xFF1E293B),
              letterSpacing: -0.5,
            ),
          ),

          const SizedBox(height: 12),

          // Description
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: isDarkMode
                  ? const Color(0xFF94A3B8)
                  : const Color(0xFF64748B),
              height: 1.5,
            ),
          ),

          if (showCreateButton) ...[
            const SizedBox(height: 32),

            // Create Course Button
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              child: ElevatedButton.icon(
                onPressed: () async {
                  await context.push(AddCourseView.id);
                },
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
                  Icons.add_rounded,
                  size: 20,
                ),
                label: const Text(
                  'Create Your First Course',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
