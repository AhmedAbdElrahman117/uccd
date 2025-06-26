import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/filter_chips.dart';
import 'package:uccd/Core/theme_helper.dart';
import 'package:uccd/Features/User/My%20Courses/Presentation/Views%20Model/My%20Courses%20Cubit/my_courses_cubit.dart';
import 'package:uccd/generated/l10n.dart';

class MyCoursesHeader extends StatelessWidget {
  const MyCoursesHeader({
    super.key,
    required this.isDarkMode,
    required this.textColor,
    required this.myCoursesCubit,
  });

  final bool isDarkMode;
  final Color textColor;
  final MyCoursesCubit myCoursesCubit;

  @override
  Widget build(BuildContext context) {
    final List<String> filters = [
      S.of(context).all,
      S.of(context).completed,
      S.of(context).inProgress,
      S.of(context).pending,
      S.of(context).rejected,
    ];
    return Container(
      color: isDarkMode ? const Color(0xFF252525) : Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).myCoursesTitle,
                  style: ThemeHelper.style20Bold(context).copyWith(
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  S.of(context).trackEnrolledCourses,
                  style: ThemeHelper.style14Regular(context).copyWith(
                    color: textColor.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
          FilterChips(
            onChange: (option) {
              // Convert localized option back to English for the cubit
              String statusToFilter;
              if (option == S.of(context).all) {
                statusToFilter = 'All';
              } else if (option == S.of(context).completed) {
                statusToFilter = 'Completed';
              } else if (option == S.of(context).inProgress) {
                statusToFilter = 'In Progress';
              } else if (option == S.of(context).pending) {
                statusToFilter = 'Pending';
              } else if (option == S.of(context).rejected) {
                statusToFilter = 'Rejected';
              } else {
                statusToFilter = option; // Fallback
              }
              myCoursesCubit.filterByStatus(statusToFilter);
            },
            options: filters,
          ),
        ],
      ),
    );
  }
}
