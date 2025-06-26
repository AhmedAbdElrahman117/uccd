import 'package:flutter/material.dart';
import 'package:uccd/generated/l10n.dart';

class CommentTextField extends StatelessWidget {
  const CommentTextField({
    super.key,
    required this.commentController,
    required this.isLoading,
    required this.textColor,
    required this.isDarkMode,
  });

  final TextEditingController commentController;
  final bool isLoading;
  final Color textColor;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: commentController,
      enabled: !isLoading,
      style: TextStyle(color: textColor),
      maxLines: null,
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      decoration: InputDecoration(
        hintText: S.of(context).addCommentHint,
        hintStyle: TextStyle(color: textColor.withValues(alpha: 0.6)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: isDarkMode ? const Color(0xFF333333) : Colors.grey.shade200,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        isDense: true,
        errorStyle: const TextStyle(color: Colors.red),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).commentValidationEmpty;
        } else if (value.trim().isEmpty) {
          return S.of(context).commentValidationTrimmed;
        }
        return null;
      },
    );
  }
}
