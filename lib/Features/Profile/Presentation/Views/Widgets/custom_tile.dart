import 'package:flutter/material.dart';
import 'package:uccd/Core/app_text.dart';

class CustomTile extends StatelessWidget {
  const CustomTile(
      {super.key, required this.title, required this.icon, this.onTap});

  final String title;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: ListTile(
        leading: Icon(
          icon,
          size: 24,
          color: Theme.of(context).iconTheme.color,
        ),
        title: Text(
          title,
          style: AppText.style14Bold(context),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 20,
          color: Theme.of(context).iconTheme.color,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        onTap: onTap,
      ),
    );
  }
}
