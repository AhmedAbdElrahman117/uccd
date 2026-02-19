import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/User/Home/Presentation/Views%20Model/User%20Home%20Cubit/user_home_cubit.dart';
import 'package:uccd/generated/l10n.dart';

class CourseEmptyState extends StatelessWidget {
  final bool isDarkMode;
  final Color textColor;
  final UserHomeCubit cubit;
  final TextEditingController searchController;
  final bool isFiltered;

  const CourseEmptyState({
    super.key,
    required this.isDarkMode,
    required this.textColor,
    required this.cubit,
    required this.searchController,
    required this.isFiltered,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.bookOpen,
            size: 64,
            color: textColor.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          Text(
            S.of(context).noCoursesFound,
            style: AppText.style18Bold(context).copyWith(
              color: textColor,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              isFiltered
                  ? S.of(context).tryChangingFilters
                  : S.of(context).coursesWillAppear,
              textAlign: TextAlign.center,
              style: AppText.style14Regular(context).copyWith(
                color: textColor.withValues(
                  alpha: 0.7,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          if (isFiltered)
            ElevatedButton.icon(
              onPressed: () {
                searchController.clear();
                cubit.resetFilters();
              },
              icon: const Icon(Icons.refresh),
              label: Text(S.of(context).showAllCourses),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primary,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
