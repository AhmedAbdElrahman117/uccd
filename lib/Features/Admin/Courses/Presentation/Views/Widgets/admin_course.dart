import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Components/Hero/hero_image.dart';
import 'package:uccd/Core/Components/Hero/hero_title.dart';
import 'package:uccd/Core/Components/counter_banner.dart';
import 'package:uccd/Core/Components/item_background.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/course_details_view.dart';

class AdminCourse extends StatelessWidget {
  const AdminCourse({
    super.key,
    this.onTap,
    required this.course,
    required this.tags,
    this.showCounter = true,
    this.showControlPanel = true,
    required this.imageHeight,
  });

  final void Function()? onTap;
  final CourseModel course;
  final Map<String, String> tags;
  final bool showCounter;
  final bool showControlPanel;
  final double imageHeight;

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
        children: [
          HeroImage(
            tag: tags['Image']!,
            imageHeight: imageHeight,
            image: course.imageLink,
            topLeftRadius: 16,
            topRightRadius: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ListTile(
                  title: HeroTitle(
                    tag: tags['Title']!,
                    title: course.title,
                  ),
                  trailing: Visibility(
                    visible: showCounter,
                    child: Hero(
                      tag: tags['Counter']!,
                      child: CounterBanner(
                        current: course.currentStudents!,
                        max: course.maxAcceptedStudents,
                      ),
                    ),
                  ),
                  contentPadding: EdgeInsets.zero,
                ),
                Center(
                  child: IconButton.outlined(
                    onPressed: () {
                      OverlayController.showAvailableCourseMenu(
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
