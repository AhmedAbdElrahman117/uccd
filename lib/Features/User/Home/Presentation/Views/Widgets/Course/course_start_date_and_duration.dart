import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/Hero/hero_date.dart';
import 'package:uccd/Core/Components/Hero/hero_duration.dart';

class CourseStartDateAndDuration extends StatelessWidget {
  const CourseStartDateAndDuration({
    super.key,
    required this.tags,
  });

  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeroDate(
          tag: tags[0],
          fontSize: 18,
          date: '11/7/2024',
        ),
        const SizedBox(height: 28),
        HeroDuration(
          tag: tags[1],
          fontSize: 18,
          duration: '40 Hour',
        ),
      ],
    );
  }
}
