import 'package:flutter/material.dart';

class AdminCourseButton extends StatelessWidget {
  const AdminCourseButton({
    super.key,
    required this.title,
    required this.backgroundColor,
    this.onPressed,
    required this.icon,
  });

  final String title;
  final Color backgroundColor;
  final void Function()? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      label: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          title,
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
