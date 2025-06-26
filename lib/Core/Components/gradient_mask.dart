import 'package:flutter/material.dart';

class GradientMask extends StatelessWidget {
  const GradientMask({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const RadialGradient(
          colors: [
            Color(0xFF4B84B8),
            Color(0xFF42AD5A),
            Color(0xFF44A769),
          ],
          center: Alignment.centerLeft,
          radius: 0.5,
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: child,
    );
  }
}
