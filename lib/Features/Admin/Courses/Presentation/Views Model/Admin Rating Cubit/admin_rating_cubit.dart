import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Features/Admin/Courses/Data/admin_rating_repo.dart';

import 'admin_rating_states.dart';

class AdminRatingCubit extends Cubit<AdminRatingStates> {
  AdminRatingCubit({required this.courseId})
      : super(AdminRatingInitialState()) {
    getRatings();
  }

  final String courseId;

  AdminRatingRepo repo = AdminRatingRepo();

  void getRatings() {
    emit(AdminRatingLoading());
    repo.getRatings(courseId: courseId).listen(
      (ratings) {
        ratings.isEmpty
            ? emit(AdminRatingEmpty())
            : emit(
                AdminRatingLoaded(ratings: ratings),
              );
      },
      onError: (error) {
        emit(
          AdminRatingFailed(errorMessage: error.toString()),
        );
      },
    );
  }
}
