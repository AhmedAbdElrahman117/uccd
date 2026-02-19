import 'package:flutter/material.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Categories/category_theme_helper.dart';
import 'package:uccd/generated/l10n.dart';

class CategoryViewFooter extends StatelessWidget {
  const CategoryViewFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(CategoryThemeHelper.cardMargin),
      padding: const EdgeInsets.all(CategoryThemeHelper.cardPadding),
      child: Column(
        children: [
          Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  CategoryThemeHelper.getCardBorderColor(context).withAlpha(0),
                  CategoryThemeHelper.getCardBorderColor(context),
                  CategoryThemeHelper.getCardBorderColor(context).withAlpha(0),
                ],
              ),
            ),
          ),
          const SizedBox(height: CategoryThemeHelper.sectionSpacing),
          Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.category_outlined,
                size: 16,
                color: CategoryThemeHelper.getSecondaryTextColor(context),
              ),
              Text(
                S.of(context).manageCategoriesEfficiently,
                style:
                    CategoryThemeHelper.getCategoryDateStyle(context).copyWith(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          const SizedBox(height: CategoryThemeHelper.cardMargin),
        ],
      ),
    );
  }
}
