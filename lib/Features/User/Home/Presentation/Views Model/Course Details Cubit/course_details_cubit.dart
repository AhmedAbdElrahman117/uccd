import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Features/User/Home/Data/user_home_repo.dart';
import 'package:uccd/Features/User/Home/Presentation/Views%20Model/Course%20Details%20Cubit/course_details_states.dart';

class CourseDetailsCubit extends Cubit<CourseDetailsStates> {
  CourseDetailsCubit(this.course) : super(InitialState()) {
    checkEnrollmentStatus(course);
  }

  CourseDetailsCubit.noStatusCheck(this.course) : super(InitialState());

  final CourseModel course;
  final UserHomeRepo repo = UserHomeRepo();
  StreamSubscription? _subscription;

  void checkEnrollmentStatus(CourseModel course) async {
    emit(StatusLoading());
    _subscription = repo.enrollmentStatus(course).listen(
      (message) {
        emit(
          StatusLoaded(
            status: message,
            canEnroll: message == 'Enroll Now',
          ),
        );
      },
      onError: (error) => emit(
        StatusFailed(errorMessage: error.toString()),
      ),
    );
  }

  void registerInCourse(
      {required String courseID, required String categoryID}) async {
    emit(RegisterLoading());
    try {
      await repo.registerInCourse(
        courseID: courseID,
        categoryID: categoryID,
      );
      emit(RegisterSuccess());
    } catch (e) {
      emit(
        RegisterFailed(errorMessage: e.toString()),
      );
    }
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    log('closed');
    return super.close();
  }
}
