import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/dashboard_model.dart';
import 'package:uccd/Core/app_dates.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/AppBar/user_logo.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/Themes/admin_home_theme_helper.dart';
import 'package:uccd/generated/l10n.dart';
import 'package:uccd/main.dart';

class AdminAppBar extends StatelessWidget {
  const AdminAppBar({
    super.key,
    this.title,
    this.showProfileAvatar = true,
    this.onProfileTap,
    this.actions,
    this.dashboardData,
  });

  final String? title;
  final bool showProfileAvatar;
  final VoidCallback? onProfileTap;
  final List<Widget>? actions;
  final DashboardModel? dashboardData;
  String _formatNumber(int? number, BuildContext context) {
    if (number == null) return AppDates.formatLocalizedNumber(0, context);
    if (number >= 1000) {
      return '${AppDates.formatLocalizedNumberDigits(number / 1000, context)}k';
    }
    return AppDates.formatLocalizedNumber(number, context);
  }

  @override
  Widget build(BuildContext context) {
    final userName = InternalStorage.getString('name').isNotEmpty
        ? InternalStorage.getString('name')
        : S.of(context).admin;

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
      decoration: BoxDecoration(
        gradient: AdminHomeThemeHelper.getHeaderGradient(context),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(AdminHomeThemeHelper.radiusLarge),
          bottomRight: Radius.circular(AdminHomeThemeHelper.radiusLarge),
        ),
        boxShadow: AdminHomeThemeHelper.getElevatedCardShadow(context),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).welcomeBack,
                        style: AppText.style14Regular(context).copyWith(
                          color: Colors.white.withAlpha(204), // 80% opacity
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        userName,
                        style: AppText.style20Bold(context).copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: onProfileTap,
                  child: const UserLogo(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildQuickStat(
                    context,
                    icon: Icons.school_outlined,
                    label: S.of(context).totalCourses,
                    value: _formatNumber(dashboardData?.totalCourses, context),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildQuickStat(
                    context,
                    icon: Icons.people_outline,
                    label: S.of(context).activeStudents,
                    value:
                        _formatNumber(dashboardData?.activeStudents, context),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickStat(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(26), // 10% opacity
        borderRadius: BorderRadius.circular(AdminHomeThemeHelper.radiusMedium),
        border: Border.all(
          color: Colors.white.withAlpha(51), // 20% opacity
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: AppText.style14Bold(context).copyWith(
              color: Colors.white,
            ),
          ),
          Text(
            label,
            style: AppText.style12Regular(context).copyWith(
              color: Colors.white.withAlpha(179), // 70% opacity
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
