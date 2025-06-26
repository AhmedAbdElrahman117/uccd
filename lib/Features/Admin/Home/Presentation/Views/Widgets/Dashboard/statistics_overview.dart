import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uccd/Core/Models/dashboard_model.dart';
import 'package:uccd/Core/app_dates.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/Dashboard/stats_card.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/Themes/admin_home_theme_helper.dart';
import 'package:uccd/generated/l10n.dart';

class StatisticsOverview extends StatelessWidget {
  const StatisticsOverview({
    super.key,
    required this.dashboardData,
  });

  final DashboardModel dashboardData;
  String _formatNumber(int? number, BuildContext context) {
    if (number == null) return AppDates.formatLocalizedNumber(0, context);
    if (number >= 1000) {
      return '${AppDates.formatLocalizedNumberDigits(number / 1000, context)}k';
    }
    return AppDates.formatLocalizedNumber(number, context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AdminHomeThemeHelper.spacingMedium,
      ),
      child: Column(
        spacing: 20,
        children: [
          Row(
            children: [
              Expanded(
                child: StatsCard(
                  icon: Icons.people_outline,
                  title: S.of(context).activeStudents,
                  value: _formatNumber(
                    dashboardData.activeStudents,
                    context,
                  ),
                  color: const Color(0xFF10B981), // Green
                  isPositive: true,
                ),
              ),
            ],
          ),
          Row(
            spacing: AdminHomeThemeHelper.spacingMedium,
            children: [
              Expanded(
                child: StatsCard(
                  icon: Icons.school_outlined,
                  title: S.of(context).totalCourses,
                  value: _formatNumber(
                    dashboardData.totalCourses,
                    context,
                  ),
                  color: const Color(0xFF3B82F6), // Blue
                  isPositive: true,
                ),
              ),
              Expanded(
                child: StatsCard(
                  icon: Icons.admin_panel_settings_outlined,
                  title: S.of(context).admins,
                  value: _formatNumber(
                    dashboardData.totalAdmins,
                    context,
                  ),
                  color: Colors.cyan,
                  isPositive: true,
                ),
              ),
            ],
          ),
          Row(
            spacing: AdminHomeThemeHelper.spacingMedium,
            children: [
              Expanded(
                child: StatsCard(
                  icon: Icons.category_outlined,
                  title: S.of(context).categories,
                  value: _formatNumber(
                    dashboardData.totalCategories,
                    context,
                  ),
                  color: Colors.purple,
                  isPositive: true,
                ),
              ),
              Expanded(
                child: StatsCard(
                  icon: FontAwesomeIcons.userTie,
                  title: S.of(context).instructors,
                  value: _formatNumber(
                    dashboardData.totalInstructors,
                    context,
                  ),
                  color: Colors.deepPurpleAccent,
                  isPositive: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
