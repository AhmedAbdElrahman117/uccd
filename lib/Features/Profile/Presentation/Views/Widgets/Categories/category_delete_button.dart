import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Models/category_model.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Admin%20Category%20Cubit/admin_category_cubit.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Categories/category_action_button.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Categories/category_theme_helper.dart';
import 'package:uccd/generated/l10n.dart';

class CategoryDeleteButton extends StatelessWidget {
  const CategoryDeleteButton({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return CategoryActionButton(
      icon: Icons.delete_rounded,
      label: S.of(context).delete,
      color: CategoryThemeHelper.getDeleteActionColor(context),
      backgroundColor: CategoryThemeHelper.getDeleteActionBackgroundColor(
        context,
      ),
      onPressed: () {
        OverlayController.showDeleteDialog(
          context,
          message: S.of(context).deleteCategoryConfirmation(category.name),
          onConfirm: () {
            context.pop();
            BlocProvider.of<AdminCategoryCubit>(context).delete(
              category: category,
            );
          },
        );
      },
    );
  }
}
