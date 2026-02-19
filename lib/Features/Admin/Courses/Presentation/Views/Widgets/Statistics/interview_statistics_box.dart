import 'package:flutter/material.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Statistics/statistics_box.dart';

class InterviewStatisticsBox extends StatelessWidget {
  const InterviewStatisticsBox({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: StatisticsBox(
        colors: const [
          Colors.grey,
          Colors.green,
          Colors.red,
        ],
        sectionTitle: 'Interview',
        sections: data,
      ),
    );
  }
}
