import 'package:flutter/material.dart';
import 'package:uccd/Core/app_text.dart';

class ChartDetails extends StatelessWidget {
  const ChartDetails({
    super.key,
    required this.chartDetails,
  });

  final Map<String, Color> chartDetails;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 18,
      spacing: 20,
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.spaceEvenly,
      children: chartDetails.entries
          .map(
            (e) => Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 8,
              children: [
                CircleAvatar(
                  radius: 8,
                  backgroundColor: e.value,
                ),
                Text(
                  e.key,
                  style: AppText.style14Bold(context),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
