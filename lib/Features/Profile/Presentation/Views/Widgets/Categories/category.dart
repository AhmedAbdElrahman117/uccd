import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Core/Models/category_model.dart';
import 'package:uccd/Core/app_dates.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Admin%20Category%20Cubit/admin_category_cubit.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/control_panel.dart';

class Category extends StatelessWidget {
  const Category({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return AdaptiveContainer(
      allPadding: 6,
      child: Column(
        children: [
          ListTile(
            title: Text(
              category.name,
            ),
            subtitle: Text(
              AppDates.timeStampToString(
                category.createdAt!,
              ),
            ),
          ),
          ControlPanel(
            onEdit: () {
              OverlayController.showAddCategoryDialog(
                context,
                category,
              );
            },
            onDelete: () {
              BlocProvider.of<AdminCategoryCubit>(context).delete(
                id: category.id!,
              );
              context.pop();
            },
            deleteMessage: 'Are you Sure you want to Delete This Category',
          ),
        ],
      ),
    );
  }
}
