import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/section_title.dart';
import 'package:uccd/generated/l10n.dart';

class CommentsAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CommentsAppbar({
    super.key,
    required this.cardColor,
    required this.isDarkMode,
    required this.textColor,
  });

  final Color cardColor;
  final bool isDarkMode;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: SectionTitle(title: S.of(context).commentsTitle),
      backgroundColor: cardColor,
      elevation: 0,
      scrolledUnderElevation: 2,
      snap: true,
      floating: true,
      shape: Border(
        bottom: BorderSide(
          color: isDarkMode ? Colors.grey.shade800 : Colors.grey.shade300,
          width: 1,
        ),
      ),
      iconTheme: IconThemeData(color: textColor),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);
}
