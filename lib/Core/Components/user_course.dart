import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Components/counter_banner.dart';
import 'package:uccd/Core/Components/item_background.dart';
import 'package:uccd/Core/Components/Hero/hero_image.dart';
import 'package:uccd/Core/Components/Hero/hero_title.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/course_details_view.dart';

class UserCourse extends StatelessWidget {
  const UserCourse({
    super.key,
    required this.imageHeight,
    required this.tag,
    required this.course,
  });

  final double imageHeight;
  final Map<String, String> tag;
  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return ItemBackground(
      onTap: () async {
        await context.push(
          CourseDetailsView.id,
          extra: {
            'tags': tag,
            'data': course,
          },
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          HeroImage(
            tag: tag['Image']!,
            imageHeight: imageHeight,
            image: course.imageLink,
            topLeftRadius: 20,
            topRightRadius: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: HeroTitle(
                    tag: tag['Title']!,
                    title: course.title,
                  ),
                  trailing: Hero(
                    tag: tag['Counter']!,
                    child: CounterBanner(
                      current: course.currentStudents ?? 0,
                      max: course.maxAcceptedStudents,
                    ),
                  ),
                  contentPadding: EdgeInsets.zero,
                ),
                Text(
                  course.description,
                  style: AppText.style14Regular(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
