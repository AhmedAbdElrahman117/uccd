import 'package:flutter/material.dart';

class AdaptiveContainer extends StatelessWidget {
  const AdaptiveContainer({
    super.key,
    required this.child,
    this.allPadding,
    this.bottomLeftRadius = 16,
    this.bottomRightRadius = 16,
    this.topLeftRadius = 16,
    this.topRightRadius = 16,
    this.onTap,
    this.verticalPadding = 0,
    this.horizontalPadding = 0,
    this.fixedHieght,
    this.fixedWidth,
    this.onLongPress,
  });

  final Widget child;
  final double? allPadding;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double bottomLeftRadius;
  final double bottomRightRadius;
  final double topLeftRadius;
  final double topRightRadius;
  final void Function()? onTap;
  final double? fixedHieght;
  final double? fixedWidth;
  final void Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(bottomLeftRadius),
          bottomRight: Radius.circular(bottomRightRadius),
          topLeft: Radius.circular(topLeftRadius),
          topRight: Radius.circular(topRightRadius),
        ),
        child: Ink(
          height: fixedHieght,
          width: fixedWidth,
          padding: allPadding == null
              ? EdgeInsets.symmetric(
                  horizontal: horizontalPadding!,
                  vertical: verticalPadding!,
                )
              : EdgeInsets.all(allPadding!),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(bottomLeftRadius),
              bottomRight: Radius.circular(bottomRightRadius),
              topLeft: Radius.circular(topLeftRadius),
              topRight: Radius.circular(topRightRadius),
            ),
            color: Theme.of(context).brightness.index == 0
                ? Colors.grey.shade900
                : Colors.grey.shade100,
          ),
          child: child,
        ),
      ),
    );
  }
}
