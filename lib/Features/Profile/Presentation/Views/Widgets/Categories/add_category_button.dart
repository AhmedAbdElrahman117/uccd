import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Components/custom_button.dart';
import 'package:uccd/Core/Models/category_model.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Add%20Category%20Cubit/add_category_cubit.dart';
import 'package:uccd/generated/l10n.dart';

class AddCategoryButton extends StatelessWidget {
  const AddCategoryButton({
    super.key,
    required GlobalKey<FormState> categoryFormKey,
    required this.categoryName,
    this.category,
  }) : _categoryFormKey = categoryFormKey;

  final GlobalKey<FormState> _categoryFormKey;
  final TextEditingController categoryName;
  final CategoryModel? category;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomButton(
        title: category == null
            ? S.of(context).addButtonLabel
            : S.of(context).editButtonLabel,
        onPressed: () {
          if (_categoryFormKey.currentState!.validate()) {
            CategoryModel newcategory = CategoryModel(
              name: categoryName.text,
              id: category?.id,
            );

            if (category == null) {
              BlocProvider.of<AddCategoryCubit>(context).add(
                category: newcategory,
              );
            } else {
              BlocProvider.of<AddCategoryCubit>(context).update(
                category: newcategory,
              );
            }
          }
        },
      ),
    );
  }
}
