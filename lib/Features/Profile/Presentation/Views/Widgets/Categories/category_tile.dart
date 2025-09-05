import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Features/Profile/Presentation/Views/admin_category_view.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/custom_tile.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTile(
      title: 'Category',
      icon: Icons.category_outlined,
      onTap: () async {
        await context.push(AdminCategoryView.id);
      },
    );
  }
}
