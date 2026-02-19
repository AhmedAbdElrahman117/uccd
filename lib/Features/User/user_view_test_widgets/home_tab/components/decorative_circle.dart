import 'package:flutter/material.dart';

class DecorativeCircle extends StatelessWidget {
  final double size;
  final Color? color;

  const DecorativeCircle({
    super.key,
    required this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color ?? Colors.white.withAlpha(26),
      ),
    );
  }
}
