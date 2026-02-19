import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Models/enrolled_courses_model.dart';
import 'package:uccd/Features/User/My%20Courses/Data/user_courses_repo_impl.dart';
import 'package:uccd/Features/User/My%20Courses/Presentation/Views%20Model/My%20Courses%20Cubit/my_courses_states.dart';

class MyCoursesCubit extends Cubit<MyCoursesStates> {
  MyCoursesCubit() : super(InitialState()) {
    getCourses();
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final UserCoursesRepoImpl repo = UserCoursesRepoImpl();
  List<EnrolledCoursesModel> allCourses = [];
  String currentStatusFilter = 'All';

  void getCourses() {
    emit(DataLoading());
    repo.getUserCourse().listen((data) {
      if (data.isNotEmpty) {
        repo.getCourses(data: data).listen(
          (courses) {
            allCourses = courses;
            _applyFilter();
          },
          onError: (error) => emit(DataFailed(errorMessage: error.toString())),
        );
      } else {
        emit(DataEmpty());
      }
    }, onError: (error) => emit(DataFailed(errorMessage: error.toString())));
  }

  void filterByStatus(String status) {
    currentStatusFilter = status;
    _applyFilter();
  }

  void _applyFilter() {
    if (currentStatusFilter == 'All') {
      emit(DataLoaded(data: allCourses));
    } else {
      final filteredCourses = allCourses.where((enrolledCourse) {
        final courseStatus = _getCourseStatus(
          enrolledCourse.course,
          enrolledCourse.status,
        );
        return courseStatus == currentStatusFilter;
      }).toList();

      if (filteredCourses.isEmpty) {
        emit(DataEmpty());
      } else {
        emit(DataLoaded(data: filteredCourses));
      }
    }
  }

  String _getCourseStatus(course, bool? accepted) {
    if (accepted == null) {
      return 'Pending';
    } else if (accepted) {
      if (course.courseEndDate.toDate().isBefore(DateTime.now())) {
        return 'Completed';
      } else {
        return 'In Progress';
      }
    } else {
      return 'Rejected';
    }
  }
}
