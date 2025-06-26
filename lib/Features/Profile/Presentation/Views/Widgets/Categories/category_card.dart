import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/category_model.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Categories/category_card_divider.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Categories/category_delete_button.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Categories/category_edit_button.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Categories/category_header.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Categories/category_theme_helper.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: CategoryThemeHelper.cardMargin,
        vertical: CategoryThemeHelper.cardMargin / 2,
      ),
      decoration: CategoryThemeHelper.getCardDecoration(context).copyWith(
        color: CategoryThemeHelper.getCardBackgroundColor(context),
      ),
      child: Padding(
        padding: const EdgeInsets.all(CategoryThemeHelper.cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            CategoryHeader(
              category: category,
            ),
            const CategoryCardDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: 8,
              children: [
                CategoryEditButton(
                  category: category,
                ),
                CategoryDeleteButton(
                  category: category,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
