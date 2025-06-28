import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:uccd/Core/Components/custom_sliver_list_view.dart';
import 'package:uccd/Core/Components/filter_chips.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/Models/rating_model.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views Model/Admin Rating Cubit/admin_rating_cubit.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views Model/Admin Rating Cubit/admin_rating_states.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Rating/course_rating_summary.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Rating/ratings_count.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Rating/ratings_list_view.dart';
import 'package:uccd/generated/l10n.dart';

class AdminCourseRatingsView extends StatefulWidget {
  const AdminCourseRatingsView({super.key, required this.course});

  static String id = '/ratingsView';

  final CourseModel course;

  @override
  State<AdminCourseRatingsView> createState() => _AdminCourseRatingsViewState();
}

class _AdminCourseRatingsViewState extends State<AdminCourseRatingsView> {
  String selectedFilter = 'All';
  @override
  Widget build(BuildContext context) {
    // Initialize selectedFilter with localized string if it's still the default
    if (selectedFilter == 'All') {
      selectedFilter = S.of(context).allRatings;
    }

    return BlocProvider(
      create: (context) => AdminRatingCubit(
        courseId: widget.course.courseID!,
      ),
      child: Scaffold(
        body: CustomSliverListView(
          appBarTitle: '${widget.course.title} ${S.of(context).ratingsTitle}',
          body: BlocBuilder<AdminRatingCubit, AdminRatingStates>(
            builder: (context, state) {
              return CustomScrollView(
                slivers: [
                  // Course Rating Summary based on state
                  _buildRatingSummary(state),

                  // Filter Chips
                  SliverToBoxAdapter(
                    child: FilterChips(
                      avatar: const Icon(
                        Icons.star_outline,
                        size: 16,
                      ),
                      onChange: (option) {
                        setState(
                          () {
                            selectedFilter = option;
                          },
                        );
                      },
                      options: [
                        S.of(context).allRatings,
                        S.of(context).fiveStars,
                        S.of(context).fourStars,
                        S.of(context).threeStars,
                        S.of(context).twoStars,
                        S.of(context).oneStar,
                      ],
                    ),
                  ),

                  // Results Count based on state
                  _buildRatingsCount(state),

                  // Ratings List based on state
                  _buildRatingsList(state),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildRatingSummary(AdminRatingStates state) {
    switch (state) {
      case AdminRatingLoaded():
        final ratings = state.ratings;
        final averageOverall =
            _calculateAverageRating(ratings, (r) => r.overallRating);
        final averageContent =
            _calculateAverageRating(ratings, (r) => r.contentRating);
        final averageInstructor =
            _calculateAverageRating(ratings, (r) => r.instructorRating);
        return SliverToBoxAdapter(
          child: CourseRatingSummary(
            ratings: state.ratings,
            averageOverall: averageOverall,
            contentOverall: averageContent,
            instructorOverall: averageInstructor,
          ),
        );

      case AdminRatingLoading():
        return const SliverToBoxAdapter(
          child: Skeletonizer(
            enabled: true,
            child: CourseRatingSummary(
              ratings: [],
              averageOverall: 0,
              contentOverall: 0,
              instructorOverall: 0,
            ),
          ),
        );

      case AdminRatingEmpty():
      case AdminRatingFailed():
      case AdminRatingInitialState():
        return const SliverToBoxAdapter(
          child: CourseRatingSummary(
            ratings: [],
            averageOverall: 0.0,
            contentOverall: 0.0,
            instructorOverall: 0.0,
          ),
        );
    }
  }

  Widget _buildRatingsCount(AdminRatingStates state) {
    switch (state) {
      case AdminRatingLoaded():
        return SliverToBoxAdapter(
          child: RatingsCount(
            selectedFilter: selectedFilter,
            ratings: state.ratings,
          ),
        );

      case AdminRatingLoading():
      case AdminRatingEmpty():
      case AdminRatingFailed():
      case AdminRatingInitialState():
        return SliverToBoxAdapter(
          child: RatingsCount(
            selectedFilter: selectedFilter,
          ),
        );
    }
  }

  Widget _buildRatingsList(AdminRatingStates state) {
    switch (state) {
      case AdminRatingInitialState():
        return const SliverToBoxAdapter(
          child: SizedBox.shrink(),
        );

      case AdminRatingLoading():
        return Skeletonizer.sliver(
          enabled: true,
          child: RatingsListView(
            courseId: widget.course.courseID,
            filterRating: selectedFilter,
            ratings: _generateSkeletonRatings(),
          ),
        );

      case AdminRatingLoaded():
        return RatingsListView(
          courseId: widget.course.courseID,
          filterRating: selectedFilter,
          ratings: state.ratings,
        );

      case AdminRatingEmpty():
        return SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star_border,
                  size: 64,
                  color: Colors.grey[400],
                ),
                const SizedBox(height: 16),
                Text(
                  S.of(context).noRatingsYet,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  S.of(context).noRatingsMessage,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[500],
                      ),
                ),
              ],
            ),
          ),
        );

      case AdminRatingFailed():
        return SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 64,
                  color: Colors.red[400],
                ),
                const SizedBox(height: 16),
                Text(
                  S.of(context).errorLoadingRatings,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.red[600],
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  state.errorMessage,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[500],
                      ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (widget.course.courseID != null) {
                      BlocProvider.of<AdminRatingCubit>(context).getRatings();
                    }
                  },
                  child: Text(S.of(context).retry),
                ),
              ],
            ),
          ),
        );
    }
  }

  double _calculateAverageRating(
    List<RatingModel> ratings,
    double Function(RatingModel) getRating,
  ) {
    if (ratings.isEmpty) return 0.0;
    final total = ratings.map(getRating).reduce((a, b) => a + b);
    return total / ratings.length;
  }

  List<RatingModel> _generateSkeletonRatings() {
    return List.generate(
      3,
      (index) => RatingModel(
        rateId: 'skeleton_$index',
        courseId: widget.course.courseID ?? '',
        userId: 'skeleton_user_$index',
        userName: S.of(context).loadingUserName,
        overallRating: 4.0,
        contentRating: 4.0,
        instructorRating: 4.0,
        comment: S.of(context).loadingComment,
        createdAt: null,
      ),
    );
  }
}
