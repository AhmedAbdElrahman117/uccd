import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Core/Components/section_title.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Statistics/chart_details.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/student_pie_chart.dart';

class StudentsByYearStatistics extends StatelessWidget {
  const StudentsByYearStatistics({super.key, required this.data});

  final Map<double, num> data;

  @override
  Widget build(BuildContext context) {
    List piechartColors = [
      Colors.yellow,
      Colors.redAccent,
      Colors.indigoAccent,
      Colors.purple,
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
              title: 'Students By year',
            ),
            StudentPieChart(
              colors: piechartColors,
              piechartData: data,
            ),
            ChartDetails(
              chartDetails: {
                '1st year': piechartColors[0],
                '2nd year': piechartColors[1],
                '3rd year': piechartColors[2],
                '4th year': piechartColors[3],
              },
            ),
          ],
        ),
      ),
    );
  }
}
