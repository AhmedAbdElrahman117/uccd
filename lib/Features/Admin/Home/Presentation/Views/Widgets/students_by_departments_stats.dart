import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Core/Components/section_title.dart';
import 'package:uccd/generated/l10n.dart';

class StudentsByDepartmentsStats extends StatelessWidget {
  const StudentsByDepartmentsStats({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    // final Map<double, Color> piechartData = {
    //   40: const Color(0xFF1A73E8),
    //   20: const Color(0xFFFF6F00),
    //   18: const Color(0xFF707070),
    //   15: const Color(0xFF00C853),
    //   7: const Color(0xFF9C27B0),
    // };
    return Padding(
      padding: const EdgeInsets.all(16),
      child: AdaptiveContainer(
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: S.of(context).studentsByDepartments),
            // StudentPieChart(piechartData: piechartData),
          ],
        ),
      ),
    );
  }
}
