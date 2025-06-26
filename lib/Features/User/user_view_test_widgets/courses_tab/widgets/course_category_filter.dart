import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/filter_chips.dart';
import 'package:uccd/Features/User/Home/Presentation/Views%20Model/User%20Home%20Cubit/user_home_cubit.dart';
import 'package:uccd/generated/l10n.dart';

class CourseCategoryFilter extends StatelessWidget {
  final List<String> categories;
  final UserHomeCubit cubit;

  const CourseCategoryFilter({
    super.key,
    required this.categories,
    required this.cubit,
  });
  @override
  Widget build(BuildContext context) {
    // Get the currently selected category from the cubit
    final selectedCategory = cubit.currentCategory;

    // Create display options with localized "All" and original category names
    final displayOptions = [S.of(context).all, ...categories];

    // Map the cubit's current category to the display option
    String? selectedDisplayOption;
    if (selectedCategory == 'All') {
      selectedDisplayOption = S.of(context).all;
    } else {
      selectedDisplayOption =
          categories.contains(selectedCategory) ? selectedCategory : null;
    }

    return FilterChips(
      onChange: (option) {
        // Convert back to the original category name for the cubit
        String categoryToFilter;
        if (option == S.of(context).all) {
          categoryToFilter = 'All';
        } else {
          categoryToFilter = option; // Category names are already in English
        }
        cubit.filter(categoryToFilter);
      },
      options: displayOptions,
      initialSelection: selectedDisplayOption,
    );
  }
}
