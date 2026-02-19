import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uccd/Core/theme_helper.dart';
import 'package:uccd/generated/l10n.dart';

class MyCoursesEmptyState extends StatelessWidget {
  const MyCoursesEmptyState({
    super.key,
    required this.context,
    required this.isDarkMode,
    required this.textColor,
    required this.tabController,
  });

  final BuildContext context;
  final bool isDarkMode;
  final Color textColor;
  final TabController tabController;

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
            S.of(context).noEnrolledCourses,
            style: ThemeHelper.style18Bold(context).copyWith(
              color: textColor,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              S.of(context).browseCoursesHint,
              textAlign: TextAlign.center,
              style: ThemeHelper.style14Regular(context).copyWith(
                color: textColor.withValues(
                  alpha: 0.7,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              tabController.animateTo(1);
            },
            icon: const Icon(Icons.search),
            label: Text(S.of(context).browseCourses),
            style: ElevatedButton.styleFrom(
              backgroundColor: ThemeHelper.appPrimaryColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
