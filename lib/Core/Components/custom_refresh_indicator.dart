import 'package:flutter/material.dart';
import 'package:uccd/Core/app_color.dart';

class CustomRefreshIndicator extends StatelessWidget {
  const CustomRefreshIndicator({
    super.key,
    required this.onRefresh,
    required this.child,
  });

  final Future<void> Function() onRefresh;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: AppColor.primary,
      elevation: 4,
      child: child,
    );
  }
}
