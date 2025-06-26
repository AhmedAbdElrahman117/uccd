import 'package:flutter/material.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/Themes/admin_home_theme_helper.dart';

class StatsCard extends StatelessWidget {
  const StatsCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
    required this.isPositive,
  });

  final IconData icon;
  final String title;
  final String value;
  final Color color;
  final bool isPositive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AdminHomeThemeHelper.getDashboardCardBackgroundColor(context),
        borderRadius: BorderRadius.circular(
          AdminHomeThemeHelper.radiusCard,
        ),
        border: Border.all(
          color: AdminHomeThemeHelper.getDashboardCardBorderColor(context),
          width: 1,
        ),
        boxShadow: AdminHomeThemeHelper.getCardShadow(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withAlpha(26),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 20,
                ),
              ),
              const Spacer(),
              Icon(
                isPositive ? Icons.trending_up : Icons.trending_down,
                color: isPositive ? Colors.green : Colors.red,
                size: 16,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: AppText.style20Bold(context).copyWith(
              color: AdminHomeThemeHelper.getPrimaryTextColor(context),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: AppText.style14Regular(context).copyWith(
              color: AdminHomeThemeHelper.getSecondaryTextColor(context),
            ),
          ),
        ],
      ),
    );
  }
}
