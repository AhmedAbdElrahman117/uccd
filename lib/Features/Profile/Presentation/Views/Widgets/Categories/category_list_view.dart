import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/category_model.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Categories/category.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
    required this.categories,
  });

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Category(
            category: categories[index],
          ),
        );
      },
    );
  }
}
