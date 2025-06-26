import 'package:flutter/material.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Categories/category_theme_helper.dart';
import 'package:uccd/generated/l10n.dart';

class CategoryWarning extends StatelessWidget {
  const CategoryWarning({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(CategoryThemeHelper.cardMargin),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: CategoryThemeHelper.getHeaderGradientColors(context),
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: CategoryThemeHelper.getCardBorderColor(context),
          width: 0.5,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.info_outline,
            size: 16,
            color: CategoryThemeHelper.getSecondaryTextColor(context),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              S.of(context).categoryUsageInfo,
              style: CategoryThemeHelper.getCategoryDateStyle(context).copyWith(
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
