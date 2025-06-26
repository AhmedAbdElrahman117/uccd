import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/section_title.dart';
import 'package:uccd/Core/Models/dashboard_model.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/Dashboard/dashboard_cards.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/Dashboard/statistics_overview.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/Themes/admin_home_theme_helper.dart';
import 'package:uccd/generated/l10n.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({
    super.key,
    required this.tabController,
    required this.dashboardData,
  });

  final TabController tabController;
  final DashboardModel dashboardData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AdminHomeThemeHelper.spacingMedium,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.dashboard_outlined,
                  color: AdminHomeThemeHelper.getPrimaryTextColor(context),
                  size: 24,
                ),
                const SizedBox(width: AdminHomeThemeHelper.spacingSmall),
                Expanded(
                  child: SectionTitle(
                    title: S.of(context).dashboardOverview,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AdminHomeThemeHelper.getPrimaryAccentColor(context)
                        .withAlpha(26),
                    borderRadius: BorderRadius.circular(
                      AdminHomeThemeHelper.radiusSmall,
                    ),
                    border: Border.all(
                      color: AdminHomeThemeHelper.getPrimaryAccentColor(context)
                          .withAlpha(77),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    S.of(context).LiveData,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AdminHomeThemeHelper.getPrimaryAccentColor(
                              context),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AdminHomeThemeHelper.spacingMedium),
          StatisticsOverview(
            dashboardData: dashboardData,
          ),
          const SizedBox(height: AdminHomeThemeHelper.spacingLarge),
          DashboardCards(
            tabController: tabController,
          ),
        ],
      ),
    );
  }
}
