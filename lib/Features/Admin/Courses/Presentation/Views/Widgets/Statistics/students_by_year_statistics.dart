import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Core/Components/section_title.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Statistics/chart_details.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/student_pie_chart.dart';
import 'package:uccd/generated/l10n.dart';

class StudentsByYearStatistics extends StatelessWidget {
  const StudentsByYearStatistics({super.key, required this.data});

  final Map<double, int> data;

  @override
  Widget build(BuildContext context) {
    List<Color> piechartColors = [
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
            SectionTitle(
              title: S.of(context).studentsByYear,
            ),
            StudentPieChart(
              colors: piechartColors,
              piechartData: data,
            ),
            ChartDetails(
              chartDetails: {
                S.of(context).firstYear: piechartColors[0],
                S.of(context).secondYear: piechartColors[1],
                S.of(context).thirdYear: piechartColors[2],
                S.of(context).fourthYear: piechartColors[3],
              },
            ),
          ],
        ),
      ),
    );
  }
}
