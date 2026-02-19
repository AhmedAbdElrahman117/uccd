import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/category_model.dart';
import 'package:uccd/Core/app_dates.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Categories/category_status_indicator.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Categories/category_theme_helper.dart';
import 'package:uccd/generated/l10n.dart';

class CategoryHeader extends StatelessWidget {
  const CategoryHeader({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: CategoryThemeHelper.categoryIconContainerSize,
          height: CategoryThemeHelper.categoryIconContainerSize,
          decoration: CategoryThemeHelper.getIconContainerDecoration(context),
          child: Icon(
            Icons.category_rounded,
            size: CategoryThemeHelper.categoryIconSize,
            color: CategoryThemeHelper.getCategoryIconColor(context),
          ),
        ),
        const SizedBox(width: CategoryThemeHelper.itemSpacing),

        // Category Info
        Expanded(
          child: Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category.name,
                style: CategoryThemeHelper.getCategoryTitleStyle(context),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '${S.of(context).CreatedOn} ${AppDates.timeStampToString(category.createdAt!)}',
                style: CategoryThemeHelper.getCategoryDateStyle(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),

        const CategoryStatusIndicator(),
      ],
    );
  }
}
