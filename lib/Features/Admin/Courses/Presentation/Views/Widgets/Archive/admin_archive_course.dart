import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Components/Hero/hero_image.dart';
import 'package:uccd/Core/Components/Hero/hero_title.dart';
import 'package:uccd/Core/Components/item_background.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Archive/average_rating.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/course_details_view.dart';

class AdminArchiveCourse extends StatelessWidget {
  const AdminArchiveCourse({
    super.key,
    required this.imageHeight,
    required this.course,
    required this.tags,
  });

  final double imageHeight;
  final CourseModel course;
  final Map<String, String> tags;

  @override
  Widget build(BuildContext context) {
    return ItemBackground(
      onTap: () {
        context.push(
          CourseDetailsView.id,
          extra: {
            'data': course,
            'tags': tags,
          },
        );
      },
      child: Column(
        spacing: 20,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              HeroImage(
                tag: tags['Image']!,
                imageHeight: imageHeight,
                image: course.imageLink,
                topLeftRadius: 16,
                topRightRadius: 16,
              ),
              const AverageRating(
                average: 2.3,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeroTitle(
                  tag: tags['Title']!,
                  title: course.title,
                ),
                Center(
                  child: IconButton.outlined(
                    onPressed: () {
                      OverlayController.showArchiveCourseMenu(
                        context,
                        course,
                      );
                    },
                    icon: const Icon(Icons.menu),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
