import 'package:flutter/material.dart';

class ResponsiveGrid extends StatelessWidget {
  const ResponsiveGrid({
    super.key,
    required this.children,
    this.spacing = 16.0,
    this.runSpacing = 16.0,
    this.minWidth = 300.0,
    this.padding = const EdgeInsets.all(16.0),
    this.maxCrossAxisCount = 3,
  });

  final List<Widget> children;
  final double spacing;
  final double runSpacing;
  final double minWidth;
  final EdgeInsets padding;
  final int maxCrossAxisCount;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        // Calculate items per row based on minWidth, but cap at maxCrossAxisCount
        final calculatedItemsPerRow = (width / minWidth).floor();
        final itemsPerRow = calculatedItemsPerRow > 0
            ? calculatedItemsPerRow.clamp(1, maxCrossAxisCount)
            : 1;

        // Calculate item width accounting for spacing between items
        final totalSpacing = spacing * (itemsPerRow - 1);
        final itemWidth = (width - totalSpacing) / itemsPerRow;

        return Padding(
          padding: padding,
          child: Wrap(
            spacing: spacing,
            runSpacing: runSpacing,
            alignment: WrapAlignment.start,
            children: children.map((widget) {
              return SizedBox(
                width: itemWidth,
                child: widget,
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
