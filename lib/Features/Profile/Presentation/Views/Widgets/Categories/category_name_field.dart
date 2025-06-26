import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/Fields/custom_text_field.dart';
import 'package:uccd/generated/l10n.dart';

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
      label: S.of(context).categoryNameLabel,
      hint: S.of(context).categoryNameHint,
      icon: Icons.category,
      validator: (value) {
        if (value!.isEmpty) {
          return S.of(context).categoryNameRequired;
        }
        return null;
      },
    );
  }
}
