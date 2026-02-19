import 'package:flutter/material.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/Themes/admin_home_theme_helper.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.gradient,
    this.badge,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String description;
  final List<Color> gradient;
  final String? badge;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(
        AdminHomeThemeHelper.radiusCard,
      ),
      type: MaterialType.transparency,
      shadowColor: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(
          AdminHomeThemeHelper.radiusCard,
        ),
        splashColor: AdminHomeThemeHelper.getCardRippleColor(context),
        highlightColor: AdminHomeThemeHelper.getButtonHoverColor(context),
        onTap: onTap,
        child: Ink(
          height: 120,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: gradient,
            ),
            borderRadius: BorderRadius.circular(
              AdminHomeThemeHelper.radiusCard,
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
                      color: Colors.white.withAlpha(26), // 10% opacity
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const Spacer(),
                  if (badge != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        badge!,
                        style: AppText.style12Bold(context).copyWith(
                          color: gradient.first,
                        ),
                      ),
                    ),
                ],
              ),
              const Spacer(),
              Text(
                title,
                style: AppText.style14Bold(context).copyWith(
                  color: Colors.white,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: AppText.style12Regular(context).copyWith(
                  color: Colors.white.withAlpha(204), // 80% opacity
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
