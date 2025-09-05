import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Core/Components/section_title.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Statistics/chart_details.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/student_pie_chart.dart';

class StudentsByDepartmentStatistics extends StatelessWidget {
  const StudentsByDepartmentStatistics({
    super.key,
    required this.data,
  });

  final Map<double, num> data;

  @override
  Widget build(BuildContext context) {
    List piechartColors = [
      Colors.teal,
      Colors.brown,
      Colors.blue,
      Colors.red,
      Colors.amberAccent,
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: AdaptiveContainer(
        horizontalPadding: 16,
        verticalPadding: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 30,
          children: [
            const SectionTitle(
              title: 'Students By Department',
            ),
            StudentPieChart(
              colors: piechartColors,
              piechartData: data,
            ),
            ChartDetails(
              chartDetails: {
                'IT': piechartColors[0],
                'Mecha': piechartColors[1],
                'Auto': piechartColors[2],
                'RE': piechartColors[3],
                'O&P': piechartColors[4],
              },
            ),
          ],
        ),
      ),
    );
  }
}
