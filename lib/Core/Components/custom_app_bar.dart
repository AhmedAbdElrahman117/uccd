import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/section_title.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
  });

  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: SectionTitle(title: title),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
