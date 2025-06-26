import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/category_model.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Categories/category_action_button.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Categories/category_theme_helper.dart';
import 'package:uccd/generated/l10n.dart';

class CategoryEditButton extends StatelessWidget {
  const CategoryEditButton({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return CategoryActionButton(
      icon: Icons.edit_rounded,
      label: S.of(context).edit,
      color: CategoryThemeHelper.getEditActionColor(context),
      backgroundColor:
          CategoryThemeHelper.getEditActionBackgroundColor(context),
      onPressed: () {
        OverlayController.showAddCategoryDialog(
          context,
          category,
        );
      },
    );
  }
}
