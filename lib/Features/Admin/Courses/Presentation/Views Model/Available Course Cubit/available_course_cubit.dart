import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Features/Admin/Courses/Data/available_course_repo.dart';
import 'package:uccd/Features/Admin/Courses/Data/control_panel_repo.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Available%20Course%20Cubit/available_course_states.dart';

class AvailableCourseCubit extends Cubit<AvailableCourseStates> {
  AvailableCourseCubit() : super(AvailableCourseInitialState()) {
    getCourses();
  }

  AvailableCourseCubit.noGetter() : super(AvailableCourseInitialState());

  AvailableCourseRepo repo = AvailableCourseRepo();
  ControlPanelRepo panelRepo = ControlPanelRepo();

  StreamSubscription? subscription;

  void getCourses() {
    emit(DataLoading());
    subscription = repo.getAdminCourses().listen(
          (courses) => courses.isEmpty
              ? emit(DataEmpty())
              : emit(
                  DataLoaded(courses: courses),
                ),
          onError: (error) => emit(
            DataFailed(
              errorMessage: error.toString(),
            ),
          ),
        );
  }

  void delete({required CourseModel course}) async {
    emit(DeleteLoading());
    try {
      String message = await panelRepo.deleteCourse(
        course: course,
      );

      emit(
        DeleteSuccess(successMessage: message),
      );
    } catch (e) {
      emit(
        DeleteFailed(errorMessage: e.toString()),
      );
    }
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    subscription = null;
    return super.close();
  }
}
