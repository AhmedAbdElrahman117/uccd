import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Features/Admin/Courses/Data/available_course_repo.dart';
import 'package:uccd/Features/Admin/Courses/Data/control_panel_repo.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Add%20Course%20Cubit/add_course_states.dart';
import 'package:uccd/Features/Profile/Data/admin_category_repo.dart';
import 'package:uccd/Features/Profile/Data/admin_instructors_repo.dart';

class AddCourseCubit extends Cubit<AddCourseStates> {
  AddCourseCubit() : super(AddCourseInitialState()) {
    getCateories();
    getInstructors();
  }

  AddCourseCubit.edit(CourseModel course) : super(AddCourseInitialState());

  AddCourseCubit.getInstructors(CourseModel course)
      : super(AddCourseInitialState()) {
    getInstructors();
  }

  AddCourseCubit.getCategories(CourseModel course)
      : super(AddCourseInitialState()) {
    getCateories();
  }

  AvailableCourseRepo repo = AvailableCourseRepo();
  AdminInstructorsRepo instructorsRepo = AdminInstructorsRepo();
  AdminCategoryRepo categoryRepo = AdminCategoryRepo();
  ControlPanelRepo panelRepo = ControlPanelRepo();

  StreamSubscription? categorySub;
  StreamSubscription? instructorSub;

  void getInstructors() {
    emit(DataLoading());
    instructorSub = instructorsRepo.getInstructors().listen(
          (instructors) => emit(
            InstructorsLoaded(instructors: instructors),
          ),
          onError: (error) => emit(
            DataFailed(errorMessage: error),
          ),
        );
  }

  void getCateories() {
    emit(DataLoading());
    categorySub = categoryRepo.getCategories().listen(
          (categories) => emit(
            CategoriesLoaded(categories: categories),
          ),
          onError: (error) => emit(
            DataFailed(errorMessage: error),
          ),
        );
  }

  void add({required CourseModel course, XFile? pickedImage}) async {
    String? validationError = validateDate(course: course);
    if (validationError == null) {
      emit(AddUpdateLoading());
      try {
        String message = await repo.addCourse(
          course: course,
          pickedImage: pickedImage,
        );

        emit(
          AddUpdateSuccess(
            successMessage: message,
            isAdd: true,
          ),
        );
      } catch (e) {
        emit(
          AddUpdateFailed(errorMessage: e.toString()),
        );
      }
    } else {
      emit(
        AddUpdateFailed(errorMessage: validationError),
      );
    }
  }

  String? validateDate({required CourseModel course}) {
    if (course.courseStartDate.compareTo(course.courseEndDate).isNegative ==
            false &&
        course.courseStartDate.compareTo(course.courseEndDate) == 0) {
      return 'invalidCourseDates';
    } else if (course.interviewStartDate
                .compareTo(course.interviewEndDate)
                .isNegative ==
            false &&
        course.interviewStartDate.compareTo(course.interviewEndDate) == 0) {
      return 'invalidInterviewDates';
    } else if (course.interviewStartDate
                .compareTo(course.courseStartDate)
                .isNegative ==
            false &&
        course.interviewEndDate.compareTo(course.courseStartDate).isNegative ==
            false) {
      return 'interviewBeforeCourse';
    } else {
      return null;
    }
  }

  void updateInfo({
    required CourseModel newCourse,
    XFile? image,
  }) async {
    emit(AddUpdateLoading());
    try {
      String message = await panelRepo.editCourseInfo(
        newCourse: newCourse,
        image: image,
      );

      emit(
        AddUpdateSuccess(
          successMessage: message,
          isAdd: false,
        ),
      );
    } catch (e) {
      emit(
        AddUpdateFailed(errorMessage: e.toString()),
      );
    }
  }

  void changeCategory({
    required CourseModel course,
    required String oldCategoryID,
    required String newCategoryName,
    required String newCategoryID,
  }) async {
    emit(AddUpdateLoading());

    try {
      String message = await panelRepo.editCourseCategory(
        course: course,
        oldCategoryID: oldCategoryID,
        newCategoryName: newCategoryName,
        newCategoryID: newCategoryID,
      );

      emit(
        AddUpdateSuccess(
          successMessage: message,
          isAdd: false,
        ),
      );
    } catch (e) {
      emit(
        AddUpdateFailed(errorMessage: e.toString()),
      );
    }
  }

  void pageIndexChanged(int index) {
    emit(
      PageChanged(index: index),
    );
  }

  void animateToPage(PageController controller, int index) async {
    await controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.linear,
    );
    emit(PageChanged(index: index));
  }

  void previousPage(PageController controller) async {
    await controller.previousPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.linear,
    );

    emit(PageChanged(index: controller.page!.round()));
  }

  void nextPage(PageController controller) async {
    await controller.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.linear,
    );

    emit(PageChanged(index: controller.page!.round()));
  }

  void jumpToPage(PageController controller, index) async {
    controller.jumpToPage(index);
    emit(PageChanged(index: index));
  }

  @override
  Future<void> close() {
    categorySub?.cancel();
    instructorSub?.cancel();
    categorySub = null;
    instructorSub = null;
    return super.close();
  }
}
