import 'package:flutter/material.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/main.dart';

class CommentFieldAvatar extends StatelessWidget {
  const CommentFieldAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 18,
      backgroundColor: AppColor.primary.withValues(alpha: 0.2),
      child: Text(
        InternalStorage.getString('name')[0].toUpperCase(),
        style: AppText.style16Bold(context).copyWith(
          color: AppColor.primary,
        ),
      ),
    );
  }
}
