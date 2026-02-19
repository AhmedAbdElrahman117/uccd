import 'package:flutter/material.dart';

/// A wrapper widget that provides smooth theme transition animations
class AnimatedThemeWrapper extends StatelessWidget {
  const AnimatedThemeWrapper({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
  });

  final Widget child;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      data: Theme.of(context),
      duration: duration,
      curve: Curves.easeInOut,
      child: child,
    );
  }
}

/// Enhanced container with smooth theme-aware transitions
class AnimatedThemeContainer extends StatelessWidget {
  const AnimatedThemeContainer({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.decoration,
    this.color,
    this.width,
    this.height,
    this.duration = const Duration(milliseconds: 250),
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Decoration? decoration;
  final Color? color;
  final double? width;
  final double? height;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration,
      curve: Curves.easeInOut,
      padding: padding,
      margin: margin,
      decoration: decoration,
      color: color,
      width: width,
      height: height,
      child: child,
    );
  }
}

/// Animated text widget that smoothly transitions between theme changes
class AnimatedThemeText extends StatelessWidget {
  const AnimatedThemeText({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.duration = const Duration(milliseconds: 200),
  });

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: duration,
      curve: Curves.easeInOut,
      style: style ?? Theme.of(context).textTheme.bodyMedium!,
      child: Text(
        text,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      ),
    );
  }
}
