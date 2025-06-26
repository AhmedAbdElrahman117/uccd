import 'package:flutter/material.dart';
import 'package:uccd/Features/User/user_view_test_widgets/themes/user_theme_helper.dart';

class RateCommentTextField extends StatelessWidget {
  const RateCommentTextField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      minLines: 4,
      maxLines: 6,
      decoration: InputDecoration(
        hintText: 'Share your thoughts about the course...',
        hintStyle: UserThemeHelper.getHintTextStyle(context),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              BorderSide(color: UserThemeHelper.getCardBorderColor(context)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              BorderSide(color: UserThemeHelper.getCardBorderColor(context)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
              color: UserThemeHelper.getPrimaryStatColor(context), width: 2),
        ),
        filled: true,
        fillColor: UserThemeHelper.getPageBackgroundColor(context),
        contentPadding: const EdgeInsets.all(16),
      ),
    );
  }
}
