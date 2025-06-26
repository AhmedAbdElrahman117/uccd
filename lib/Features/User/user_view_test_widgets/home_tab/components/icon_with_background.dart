import 'package:flutter/material.dart';

class IconWithBackground extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final double size;
  final double padding;

  const IconWithBackground({
    super.key,
    required this.icon,
    required this.iconColor,
    this.size = 24,
    this.padding = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: iconColor.withAlpha(26),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: size,
      ),
    );
  }
}
