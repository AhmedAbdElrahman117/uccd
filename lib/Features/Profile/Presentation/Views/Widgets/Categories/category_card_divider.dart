import 'package:flutter/material.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Categories/category_theme_helper.dart';

class CategoryCardDivider extends StatelessWidget {
  const CategoryCardDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
