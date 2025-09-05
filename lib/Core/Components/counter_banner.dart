import 'package:flutter/material.dart';
import 'package:uccd/Core/app_text.dart';

class CounterBanner extends StatelessWidget {
  const CounterBanner({
    super.key,
    required this.current,
    required this.max,
  });

  final int current;
  final int max;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.people,
          ),
          Text(
            '$current/$max',
            style: AppText.style14Bold(context),
          ),
        ],
      ),
    );
  }
}
