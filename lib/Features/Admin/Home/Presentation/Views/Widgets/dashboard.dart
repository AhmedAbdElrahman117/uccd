import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/section_title.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/students_by_departments_stats.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/students_by_year_stats.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SectionTitle(title: 'Dashboard'),
        ),
        StudentsByDepartmentsStats(),
        StudentsByYearStats(),
      ],
    );
  }
}
