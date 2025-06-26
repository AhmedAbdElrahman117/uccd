import 'package:flutter/material.dart';
import 'package:uccd/Core/theme_helper.dart';
import 'package:uccd/Features/User/user_view_test_widgets/home_tab/components/icon_with_background.dart';

class UserInfoCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color iconColor;
  final Color? backgroundColor;
  final Color? borderColor;

  const UserInfoCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    required this.iconColor,
    this.backgroundColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ThemeHelper.paddingAll20,
      decoration: ThemeHelper.getCardDecoration(
        context,
        borderRadius: 16,
        elevation: 2,
      ),
      child: Column(
        children: [
          IconWithBackground(
            icon: icon,
            iconColor: iconColor,
          ),
          ThemeHelper.gapV12,
          Text(
            value,
            style: ThemeHelper.style16Bold(context).copyWith(
              color: context.primaryTextColor,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          ThemeHelper.gapV4,
          Text(
            label,
            style: ThemeHelper.style12Regular(context).copyWith(
              color: context.secondaryTextColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
