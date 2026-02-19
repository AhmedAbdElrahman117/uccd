import 'package:flutter/material.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Categories/category_theme_helper.dart';
import 'package:uccd/generated/l10n.dart';

class CategoryStatusIndicator extends StatelessWidget {
  const CategoryStatusIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: CategoryThemeHelper.getCategoryStatusColor(context, 'active')
            .withAlpha(26),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: CategoryThemeHelper.getCategoryStatusColor(context, 'active')
              .withAlpha(77),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  CategoryThemeHelper.getCategoryStatusColor(context, 'active'),
            ),
          ),
          Text(
            S.of(context).Active,
            style:
                CategoryThemeHelper.getActionButtonTextStyle(context).copyWith(
              color:
                  CategoryThemeHelper.getCategoryStatusColor(context, 'active'),
            ),
          ),
        ],
      ),
    );
  }
}
