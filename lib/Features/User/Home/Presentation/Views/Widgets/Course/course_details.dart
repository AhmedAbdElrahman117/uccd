import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uccd/Core/Components/Hero/hero_date.dart';
import 'package:uccd/Core/Components/Hero/hero_duration.dart';
import 'package:uccd/Core/Components/Hero/hero_location.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Core/Components/custom_info.dart';
import 'package:uccd/Core/app_dates.dart';

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
  });

  final Timestamp courseStartDate;
  final Timestamp courseEndDate;
  final Timestamp interviewStartDate;
  final Timestamp interviewEndDate;
  final int duration;
  final int roomNumber;
  final Map<String, String> tags;

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
            tag: tags['CourseDate']!,
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
            tag: tags['InterviewDate']!,
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
            tag: tags['Duration']!,
            duration: '$duration Hour',
          ),
          HeroLocation(
            tag: tags['Location']!,
            location: '$roomNumber',
          ),
        ],
      ),
    );
  }
}

// HeroImage(
//               tag: widget.tags['Image']!,
//               verticalPadding: 30,
//               imageHeight: MediaQuery.sizeOf(context).height * 0.42,
//               image: widget.course.imageLink,
//             ),
            // ListTile(
            //   title: HeroTitle(
            //     tag: widget.tags['Title']!,
            //     fontSize: 22,
            //     title: widget.course.title,
            //   ),
            //   subtitle: Text(
            //     widget.course.category,
            //     style: AppText.style14Bold(context),
            //   ),
            //   trailing: Hero(
            //     tag: widget.tags['Counter']!,
            //     child: CounterBanner(
            //       current: widget.course.currentStudents!,
            //       max: widget.course.maxAcceptedStudents,
            //     ),
            //   ),
            //   contentPadding: EdgeInsets.zero,
            // ),
            // CourseInstructorDetails(
            //   instructorName: widget.course.instructor,
            // ),
            // GridView(
            //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2,
            //     mainAxisExtent: 60,
            //   ),
            //   shrinkWrap: true,
            //   physics: const NeverScrollableScrollPhysics(),
            //   children: [
            //     HeroDate(
            //       tag: widget.tags['CourseDate']!,
            //       date: AppDates.timeStampToString(
            //         widget.course.courseStartDate,
            //       ),
            //     ),
            //     CustomInfo(
            //       info: AppDates.timeStampToString(
            //         widget.course.courseEndDate,
            //       ),
            //       icon: FontAwesomeIcons.solidCalendarCheck,
            //     ),
            //     HeroDate(
            //       tag: widget.tags['InterviewDate']!,
            //       date: AppDates.timeStampToString(
            //         widget.course.interviewStartDate,
            //       ),
            //       icon: FontAwesomeIcons.clipboardQuestion,
            //     ),
            //     CustomInfo(
            //       info: AppDates.timeStampToString(
            //         widget.course.interviewEndDate,
            //       ),
            //       icon: FontAwesomeIcons.clipboardCheck,
            //     ),
            //     HeroDuration(
            //       tag: widget.tags['Duration']!,
            //       duration: '${widget.course.duration} Hour',
            //     ),
            //     HeroLocation(
            //       tag: widget.tags['Location']!,
            //       location: '${widget.course.roomNumber}',
            //     ),
            //   ],
            // ),
            // AdaptiveContainer(
            //   allPadding: 12,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       CourseLearningsSection(
            //         goals: widget.course.courseGoals,
            //       ),
            //       ItemDescription(
            //         description: widget.course.description,
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(height: 12),

// ListView(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           children: [
            // ListTile(
            //   title: HeroTitle(
            //     tag: widget.tags['Title']!,
            //     fontSize: 22,
            //     title: widget.course.title,
            //   ),
            //   subtitle: Text(
            //     widget.course.category,
            //     style: AppText.style14Bold(context),
            //   ),
            //   trailing: Hero(
            //     tag: widget.tags['Counter']!,
            //     child: CounterBanner(
            //       current: widget.course.currentStudents!,
            //       max: widget.course.maxAcceptedStudents,
            //     ),
            //   ),
            //   contentPadding: EdgeInsets.zero,
            // ),
            // CourseInstructorDetails(
            //   instructorName: widget.course.instructor,
            // ),
            // HeroImage(
            //   tag: widget.tags['Image']!,
            //   verticalPadding: 30,
            //   imageHeight: MediaQuery.sizeOf(context).height * 0.25,
            //   image: widget.course.imageLink,
            //   isLargeImage: true,
            // ),
            // GridView(
            //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2,
            //     mainAxisExtent: 60,
            //   ),
            //   shrinkWrap: true,
            //   physics: const NeverScrollableScrollPhysics(),
            //   children: [
            //     HeroDate(
            //       tag: widget.tags['CourseDate']!,
            //       date: AppDates.timeStampToString(
            //         widget.course.courseStartDate,
            //       ),
            //     ),
            //     CustomInfo(
            //       info: AppDates.timeStampToString(
            //         widget.course.courseEndDate,
            //       ),
            //       icon: FontAwesomeIcons.solidCalendarCheck,
            //     ),
            //     HeroDate(
            //       tag: widget.tags['InterviewDate']!,
            //       date: AppDates.timeStampToString(
            //         widget.course.interviewStartDate,
            //       ),
            //       icon: FontAwesomeIcons.clipboardQuestion,
            //     ),
            //     CustomInfo(
            //       info: AppDates.timeStampToString(
            //         widget.course.interviewEndDate,
            //       ),
            //       icon: FontAwesomeIcons.clipboardCheck,
            //     ),
            //     HeroDuration(
            //       tag: widget.tags['Duration']!,
            //       duration: '${widget.course.duration} Hour',
            //     ),
            //     HeroLocation(
            //       tag: widget.tags['Location']!,
            //       location: '${widget.course.roomNumber}',
            //     ),
            //   ],
            // ),
            // AdaptiveContainer(
            //   allPadding: 12,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       CourseLearningsSection(
            //         goals: widget.course.courseGoals,
            //       ),
            //       ItemDescription(
            //         description: widget.course.description,
            //       ),
            //     ],
            //   ),
            // ),
//             const SizedBox(height: 16),
//           ],
//         ),
