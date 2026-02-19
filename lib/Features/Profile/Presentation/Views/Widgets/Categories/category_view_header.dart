import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/category_model.dart';
import 'package:uccd/Core/app_dates.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Categories/category_theme_helper.dart';
import 'package:uccd/generated/l10n.dart';

class CategoryViewHeader extends StatelessWidget {
  const CategoryViewHeader({
    super.key,
    required this.categories,
  });

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(CategoryThemeHelper.cardMargin),
      padding: const EdgeInsets.all(CategoryThemeHelper.cardPadding),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: CategoryThemeHelper.getHeaderGradientColors(context),
        ),
        borderRadius:
            BorderRadius.circular(CategoryThemeHelper.cardBorderRadius),
        border: Border.all(
          color: CategoryThemeHelper.getCardBorderColor(context),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color:
                  CategoryThemeHelper.getCategoryIconBackgroundColor(context),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.dashboard_rounded,
              size: 24,
              color: CategoryThemeHelper.getCategoryIconColor(context),
            ),
          ),
          const SizedBox(width: CategoryThemeHelper.itemSpacing),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).categoriesOverview,
                  style: CategoryThemeHelper.getCategoryTitleStyle(context)
                      .copyWith(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  S.of(context).categoryAvailable(categories.length),
                  style: CategoryThemeHelper.getCategoryDateStyle(context),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: CategoryThemeHelper.getCategoryIconColor(context)
                  .withAlpha(26),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: CategoryThemeHelper.getCategoryIconColor(context)
                    .withAlpha(77),
                width: 1,
              ),
            ),
            child: Text(
              AppDates.formatLocalizedNumber(
                categories.length,
                context,
              ),
              style: CategoryThemeHelper.getActionButtonTextStyle(context)
                  .copyWith(
                color: CategoryThemeHelper.getCategoryIconColor(context),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
