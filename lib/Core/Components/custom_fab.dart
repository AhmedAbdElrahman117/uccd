import 'package:flutter/material.dart';
import 'package:uccd/Core/app_color.dart';

class CustomFab extends StatelessWidget {
  const CustomFab({
    super.key,
    this.onPressed,
    this.icon,
  });

  final void Function()? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColor.primary,
      shape: const CircleBorder(),
      onPressed: onPressed,
      heroTag: null,
      child: Icon(
        icon ?? Icons.add,
        color: Colors.white,
      ),
    );
  }
}
