import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Models/rating_model.dart';
import 'package:uccd/Features/User/Rating/Presentation/Views%20Model/rate_course_states.dart';
import 'package:uccd/Features/User/Rating/Repo/rate_course_repo.dart';

class RateCourseCubit extends Cubit<RateCourseStates> {
  RateCourseCubit() : super(RateCourseInitialState());

  final RateCourseRepo repo = RateCourseRepo();

  void submitRating(RatingModel rating) async {
    emit(RateCourseLoading());
    try {
      await repo.submitRating(rating: rating);
      emit(RateCourseSuccess());
    } catch (e) {
      emit(RateCourseError(e.toString()));
    }
  }
}
