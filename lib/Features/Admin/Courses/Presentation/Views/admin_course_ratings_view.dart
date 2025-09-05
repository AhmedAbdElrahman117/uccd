import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/custom_sliver_list_view.dart';
import 'package:uccd/Core/Components/filter_chips.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Rating/ratings_list_view.dart';

class AdminCourseRatingsView extends StatelessWidget {
  const AdminCourseRatingsView({super.key, required this.course});

  static String id = '/ratingsView';

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomSliverListView(
        appBarTitle: 'Ratings',
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: FilterChips(
                avatar: const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                onChange: (option) {},
                options: const [
                  'All',
                  'Rate 1',
                  'Rate 2',
                  'Rate 3',
                  'Rate 4',
                  'Rate 5',
                ],
              ),
            ),
            const RatingsListView(),
          ],
        ),
      ),
    );
  }
}
