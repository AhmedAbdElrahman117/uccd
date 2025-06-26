import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/category_model.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Categories/category_view_footer.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Categories/category_view_header.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Categories/category_warning.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Categories/category_card.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Categories/category_theme_helper.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
    required this.categories,
  });

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CategoryThemeHelper.getBackgroundColor(context),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: CategoryViewHeader(
              categories: categories,
            ),
          ),

          const SliverToBoxAdapter(
            child: CategoryWarning(),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: CategoryThemeHelper.cardMargin,
              vertical: CategoryThemeHelper.cardMargin,
            ),
            sliver: SliverList.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CategoryCard(
                  category: categories[index],
                );
              },
            ),
          ),

          // Footer Section
          const SliverToBoxAdapter(
            child: CategoryViewFooter(),
          ),
        ],
      ),
    );
  }
}
