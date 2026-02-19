import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uccd/Core/Components/custom_info.dart';
import 'package:uccd/Core/Components/Hero/hero_location.dart';

class CourseEndDateAndLocation extends StatelessWidget {
  const CourseEndDateAndLocation({
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
        const CustomInfo(
          info: '17/7/2024',
          icon: FontAwesomeIcons.solidCalendarCheck,
          fontSize: 18,
        ),
        const SizedBox(height: 28),
        HeroLocation(
          tag: tags[2],
          fontSize: 18,
          location: '306',
        ),
      ],
    );
  }
}
