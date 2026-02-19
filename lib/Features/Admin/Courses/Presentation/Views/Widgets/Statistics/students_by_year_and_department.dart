import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Core/Components/section_title.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Statistics/chart_details.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/student_line_chart.dart';
import 'package:uccd/generated/l10n.dart';

class StudentsByYearAndDepartment extends StatelessWidget {
  const StudentsByYearAndDepartment({
    super.key,
    required this.data,
  });

  final Map<String, List<int>> data;

  @override
  Widget build(BuildContext context) {
    return AdaptiveContainer(
      horizontalPadding: 16,
      verticalPadding: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 40,
        children: [
          SectionTitle(
            title: S.of(context).studentsByDepartmentAndYear,
          ),
          StudentLineChart(
            data: data,
            rodColors: const [
              Colors.yellow,
              Colors.redAccent,
              Colors.indigoAccent,
              Colors.purple,
            ],
          ),
          ChartDetails(
            chartDetails: {
              S.of(context).firstYear: Colors.yellow,
              S.of(context).secondYear: Colors.redAccent,
              S.of(context).thirdYear: Colors.indigoAccent,
              S.of(context).fourthYear: Colors.purple,
            },
          ),
        ],
      ),
    );
  }
}
