import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Core/app_text.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.backgroundColor,
  });

  final String title;
  final IconData icon;
  final void Function()? onTap;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AdaptiveContainer(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton.outlined(
            onPressed: null,
            icon: Icon(
              icon,
              color: Colors.white,
            ),
            style: IconButton.styleFrom(
              padding: const EdgeInsets.all(12),
              disabledBackgroundColor: backgroundColor,
            ),
          ),
          Text(
            title,
            style: AppText.style14Regular(context),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
