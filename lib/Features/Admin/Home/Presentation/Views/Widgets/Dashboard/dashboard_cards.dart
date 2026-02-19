import 'package:flutter/material.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/Dashboard/dashboard_card.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/Themes/admin_home_theme_helper.dart';
import 'package:uccd/generated/l10n.dart';

class DashboardCards extends StatelessWidget {
  const DashboardCards({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AdminHomeThemeHelper.spacingMedium,
      ),
      child: Row(
        spacing: 0, //16
        children: [
          Visibility(
            visible: false,
            child: Expanded(
              child: DashboardCard(
                icon: Icons.analytics_outlined,
                title: S.of(context).courseAnalytics,
                description: 'View detailed statistics',
                gradient: AdminHomeThemeHelper.getDashboardAnalyticsGradient(
                  context,
                ),
                onTap: () {},
              ),
            ),
          ),
          Expanded(
            child: DashboardCard(
              icon: Icons.settings_outlined,
              title: S.of(context).settings,
              description: S.of(context).SystemConfiguration,
              gradient:
                  AdminHomeThemeHelper.getDashboardSettingsGradient(context),
              onTap: () {
                tabController.animateTo(3);
              },
            ),
          ),
        ],
      ),
    );
  }
}
