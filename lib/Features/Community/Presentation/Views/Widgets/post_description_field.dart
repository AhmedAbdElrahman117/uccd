import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/Fields/custom_text_field.dart';

class PostDescriptionField extends StatelessWidget {
  const PostDescriptionField({
    super.key,
    required this.postDescription,
  });

  final TextEditingController postDescription;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      textController: postDescription,
      label: 'Post Description',
      hint: 'Enter Post Description',
      icon: Icons.post_add,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Post Description Required';
        }
        return null;
      },
    );
  }
}
