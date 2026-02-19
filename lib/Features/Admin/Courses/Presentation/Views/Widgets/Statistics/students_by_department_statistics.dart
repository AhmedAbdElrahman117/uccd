import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Core/Components/section_title.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Statistics/chart_details.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/student_pie_chart.dart';
import 'package:uccd/generated/l10n.dart';

class StudentsByDepartmentStatistics extends StatelessWidget {
  const StudentsByDepartmentStatistics({
    super.key,
    required this.data,
  });

  final Map<double, int> data;

  @override
  Widget build(BuildContext context) {
    List<Color> piechartColors = [
      Colors.teal,
      Colors.brown,
      Colors.blue,
      Colors.red,
      Colors.amber,
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
            SectionTitle(
              title: S.of(context).studentsByDepartments,
            ),
            StudentPieChart(
              colors: piechartColors,
              piechartData: data,
            ),
            ChartDetails(
              chartDetails: {
                S.of(context).itDepartment: piechartColors[0],
                S.of(context).mechaDepartment: piechartColors[1],
                S.of(context).autoDepartment: piechartColors[2],
                S.of(context).reDepartment: piechartColors[3],
                S.of(context).opDepartment: piechartColors[4],
              },
            ),
          ],
        ),
      ),
    );
  }
}
