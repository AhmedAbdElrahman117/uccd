import 'package:flutter/material.dart';

class AdaptiveTabView extends StatelessWidget {
  const AdaptiveTabView({
    super.key,
    required this.tabController,
    required this.children,
  });

  final TabController tabController;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? const Color(0xFF1A1A1A) : Colors.white;

    return Container(
      color: backgroundColor,
      child: TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: children,
      ),
    );
  }
}
