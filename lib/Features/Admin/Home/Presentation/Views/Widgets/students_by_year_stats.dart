import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Core/Components/section_title.dart';

class StudentsByYearStats extends StatelessWidget {
  const StudentsByYearStats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: AdaptiveContainer(
        child: Column(
          spacing: 30,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: 'Students By year'),
            // StudentLineChart(),
          ],
        ),
      ),
    );
  }
}
