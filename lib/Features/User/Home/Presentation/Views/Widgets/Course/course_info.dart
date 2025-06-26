import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/Hero/hero_title.dart';
import 'package:uccd/Core/Components/counter_banner.dart';
import 'package:uccd/Core/app_text.dart';

class CourseInfo extends StatelessWidget {
  const CourseInfo({
    super.key,
    required this.tags,
    required this.title,
    required this.category,
    this.currentStudents,
    required this.maxAcceptedStudents,
  });

  final Map<String, String> tags;
  final String title;
  final String category;
  final int? currentStudents;
  final int maxAcceptedStudents;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: HeroTitle(
        tag: tags['Title'] ?? 'title',
        fontSize: 22,
        title: title,
      ),
      subtitle: Text(
        category,
        style: AppText.style14Bold(context),
      ),
      trailing: Hero(
        tag: tags['Counter'] ?? 'counter',
        child: CounterBanner(
          current: currentStudents ?? 0,
          max: maxAcceptedStudents,
        ),
      ),
      contentPadding: EdgeInsets.zero,
    );
  }
}
