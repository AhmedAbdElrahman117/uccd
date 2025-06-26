import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Core/Components/section_title.dart';
import 'package:uccd/generated/l10n.dart';

class StudentsByYearStats extends StatelessWidget {
  const StudentsByYearStats({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: AdaptiveContainer(
        child: Column(
          spacing: 30,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: S.of(context).studentsByYear),
            // StudentLineChart(),
          ],
        ),
      ),
    );
  }
}
