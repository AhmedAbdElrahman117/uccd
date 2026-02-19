import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uccd/Core/Components/Hero/hero_date.dart';
import 'package:uccd/Core/Components/Hero/hero_duration.dart';
import 'package:uccd/Core/Components/Hero/hero_location.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Core/Components/custom_info.dart';
import 'package:uccd/Core/app_dates.dart';
import 'package:uccd/generated/l10n.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({
    super.key,
    required this.tags,
    required this.courseStartDate,
    required this.courseEndDate,
    required this.interviewStartDate,
    required this.interviewEndDate,
    required this.duration,
    required this.roomNumber,
    required this.isDarkMode,
  });

  final Timestamp courseStartDate;
  final Timestamp courseEndDate;
  final Timestamp interviewStartDate;
  final Timestamp interviewEndDate;
  final int duration;
  final int roomNumber;
  final Map<String, String> tags;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return AdaptiveContainer(
      horizontalPadding: 16,
      verticalPadding: 8,
      child: GridView(
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 60,
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          HeroDate(
            tag: tags['CourseDate'] ?? 'courseDate',
            date: AppDates.timeStampToString(
              courseStartDate,
            ),
          ),
          CustomInfo(
            info: AppDates.timeStampToString(
              courseEndDate,
            ),
            icon: FontAwesomeIcons.solidCalendarCheck,
          ),
          HeroDate(
            tag: tags['InterviewDate'] ?? 'interviewDate',
            date: AppDates.timeStampToString(
              interviewStartDate,
            ),
            icon: FontAwesomeIcons.clipboardQuestion,
          ),
          CustomInfo(
            info: AppDates.timeStampToString(
              interviewEndDate,
            ),
            icon: FontAwesomeIcons.clipboardCheck,
          ),
          HeroDuration(
            tag: tags['Duration'] ?? 'duration',
            duration:
                '${getLocalizedNumber(roomNumber, context)} ${S.of(context).Hour}',
          ),
          HeroLocation(
            tag: tags['Location'] ?? 'location',
            location: getLocalizedNumber(
              roomNumber,
              context,
            ),
          ),
        ],
      ),
    );
  }

  String getLocalizedNumber(num number, BuildContext context) {
    return AppDates.formatLocalizedNumber(number, context);
  }
}
