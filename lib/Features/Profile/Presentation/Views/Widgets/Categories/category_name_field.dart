import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/Fields/custom_text_field.dart';

class CategoryNameField extends StatelessWidget {
  const CategoryNameField({
    super.key,
    required this.categoryName,
  });

  final TextEditingController categoryName;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      textController: categoryName,
      label: 'Category Name',
      hint: 'Enter Category Name',
      icon: Icons.category,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Category Name Required';
        }
        return null;
      },
    );
  }
}
