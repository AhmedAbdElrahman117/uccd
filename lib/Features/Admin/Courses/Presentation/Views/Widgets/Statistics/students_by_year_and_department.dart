import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Core/Components/section_title.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Statistics/chart_details.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/student_line_chart.dart';

class StudentsByYearAndDepartment extends StatelessWidget {
  const StudentsByYearAndDepartment({
    super.key,
    required this.data,
  });

  final Map<String, List<double>> data;

  @override
  Widget build(BuildContext context) {
    return AdaptiveContainer(
      horizontalPadding: 16,
      verticalPadding: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 40,
        children: [
          const SectionTitle(
            title: 'Students By Department & year',
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
          const ChartDetails(
            chartDetails: {
              '1st year': Colors.yellow,
              '2nd year': Colors.redAccent,
              '3rd year': Colors.indigoAccent,
              '4th year': Colors.purple,
            },
          ),
        ],
      ),
    );
  }
}
