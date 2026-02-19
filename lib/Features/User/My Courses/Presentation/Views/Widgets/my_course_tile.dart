import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/app_assets.dart';

class MyCourseTile extends StatelessWidget {
  const MyCourseTile({
    super.key,
    required this.course,
    required this.studnetStatus,
  });

  final CourseModel course;
  final bool? studnetStatus;

  @override
  Widget build(BuildContext context) {
    return AdaptiveContainer(
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: course.imageLink == null
              ? Image.asset(AppAssets.imagesUCCDGrouplogo2)
              : CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(
                    course.imageLink!,
                  ),
                ),
        ),
        title: Text(course.title),
        subtitle: Text(
          checkCourseStatus(course.courseEndDate),
        ),
      ),
    );
  }

  String checkCourseStatus(Timestamp courseDate) {
    if (studnetStatus == null) {
      return 'Interview Pending';
    } else if (studnetStatus!) {
      if (courseDate.compareTo(Timestamp.now()) == 1 ||
          courseDate.compareTo(Timestamp.now()) == 0) {
        return 'In Progress';
      } else {
        return 'Completed';
      }
    } else {
      return 'Rejected';
    }
  }
}
