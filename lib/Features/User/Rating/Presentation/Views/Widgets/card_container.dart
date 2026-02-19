import 'package:flutter/material.dart';
import 'package:uccd/Features/User/user_view_test_widgets/themes/user_theme_helper.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: UserThemeHelper.getCardDecoration(context).copyWith(
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}
