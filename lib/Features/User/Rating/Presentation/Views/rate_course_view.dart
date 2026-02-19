import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Components/custom_loading_indicator.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/app_banners.dart';
import 'package:uccd/Features/User/Rating/Presentation/Views%20Model/rate_course_cubit.dart';
import 'package:uccd/Features/User/Rating/Presentation/Views%20Model/rate_course_states.dart';
import 'package:uccd/Features/User/Rating/Presentation/Views/Widgets/rate_comment_section.dart';
import 'package:uccd/Features/User/Rating/Presentation/Views/Widgets/rate_course_header.dart';
import 'package:uccd/Features/User/Rating/Presentation/Views/Widgets/rating_cards_list.dart';
import 'package:uccd/Features/User/Rating/Presentation/Views/Widgets/submit_rate_button.dart';
import 'package:uccd/Features/User/user_view_test_widgets/themes/user_theme_helper.dart';

class RateCourseView extends StatefulWidget {
  const RateCourseView({
    super.key,
    required this.course,
  });

  final CourseModel course;

  @override
  State<RateCourseView> createState() => _RateCourseViewState();
}

class _RateCourseViewState extends State<RateCourseView> {
  final TextEditingController _commentController = TextEditingController();

  double _overallRate = 0;
  double _contentRate = 0;
  double _instructorRate = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RateCourseCubit(),
      child: Stack(
        children: [
          BlocListener<RateCourseCubit, RateCourseStates>(
            listener: (context, state) {
              if (state is RateCourseSuccess) {
                context.pop();
                AppBanners.showSuccess(
                  message: 'Rate Submitted Successfully',
                );
              } else if (state is RateCourseError) {
                AppBanners.showFailed(
                  message: state.errorMessage,
                );
              }
            },
            child: Scaffold(
              backgroundColor: UserThemeHelper.getPageBackgroundColor(context),
              appBar: _buildAppBar(),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const RateCourseHeader(),
                    const SizedBox(height: 24),
                    RatingCardsList(
                      onRatingOverallChanged: (rating) => setState(
                        () => _overallRate = rating,
                      ),
                      onRatingContentChanged: (rating) => setState(
                        () => _contentRate = rating,
                      ),
                      onRatingInstructorChanged: (rating) => setState(
                        () => _instructorRate = rating,
                      ),
                      contentRate: _contentRate,
                      instructorRate: _instructorRate,
                      overallRate: _overallRate,
                    ),
                    const SizedBox(height: 24),
                    RateCommentSection(
                      commentController: _commentController,
                    ),
                    const SizedBox(height: 32),
                    SubmitRateButton(
                      course: widget.course,
                      overallRate: _overallRate,
                      contentRate: _contentRate,
                      instructorRate: _instructorRate,
                      commentController: _commentController,
                    ),
                  ],
                ),
              ),
            ),
          ),
          BlocSelector<RateCourseCubit, RateCourseStates, bool>(
            selector: (state) {
              return state is RateCourseLoading;
            },
            builder: (context, state) {
              return CustomLoadingIndicator(
                isLoading: state,
                child: const SizedBox(),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text(
        'Rate Course',
      ),
      forceMaterialTransparency: true,
      elevation: 0,
    );
  }
}
