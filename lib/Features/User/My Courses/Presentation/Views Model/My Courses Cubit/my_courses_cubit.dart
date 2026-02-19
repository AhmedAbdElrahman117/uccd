import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/Models/enrolled_courses_model.dart';
import 'package:uccd/Features/User/My%20Courses/Data/user_courses_repo.dart';
import 'package:uccd/Features/User/My%20Courses/Presentation/Views%20Model/My%20Courses%20Cubit/my_courses_states.dart';

class MyCoursesCubit extends Cubit<MyCoursesStates> {
  MyCoursesCubit({this.limit, this.acceptedOnly}) : super(InitialState()) {
    getCourses();
  }

  final int? limit;
  final bool? acceptedOnly;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final UserCoursesRepo repo = UserCoursesRepo();
  StreamSubscription? _coursesSubscription;
  List<EnrolledCoursesModel>? _allCourses; // Store all fetched courses
  String _currentFilter = 'All'; // Track current filter

  void getCourses() {
    emit(DataLoading());
    repo
        .getUserCourse(
      limit: limit,
      acceptedOnly: acceptedOnly,
    )
        .listen(
      (data) {
        if (data.isNotEmpty) {
          _coursesSubscription = repo
              .getCourses(
            userCourseIds: data.keys.toList(),
          )
              .listen(
            (courses) async {
              if (courses.isEmpty) {
                emit(DataEmpty());
              } else {
                final enrolledCourses = await toEnrolledModel(
                  courses,
                  data,
                );
                _allCourses = enrolledCourses; // Store all courses

                // Apply current filter if not 'All'
                if (_currentFilter != 'All') {
                  final filteredCourses =
                      _filterCoursesByStatus(_allCourses!, _currentFilter);
                  emit(
                    DataLoaded(data: filteredCourses),
                  );
                } else {
                  emit(
                    DataLoaded(data: enrolledCourses),
                  );
                }
              }
            },
            onError: (error) {
              log('message 1');
              emit(
                DataFailed(errorMessage: error.toString()),
              );
            },
          );
        } else {
          emit(DataEmpty());
        }
      },
      onError: (error) {
        log('message 2');
        emit(
          DataFailed(errorMessage: error.toString()),
        );
      },
    );
  }

  // Method to filter courses by status and emit the filtered list
  void filterByStatus(String filter) {
    _currentFilter = filter;

    // If we have courses data and it's not loading state, apply the filter
    if (_allCourses != null && state is! DataLoading) {
      if (filter == 'All') {
        emit(DataLoaded(data: _allCourses!));
      } else {
        final filteredCourses = _filterCoursesByStatus(_allCourses!, filter);

        // If there are no courses after filtering, emit empty state
        if (filteredCourses.isEmpty) {
          emit(DataEmpty());
        } else {
          emit(DataLoaded(data: filteredCourses));
        }
      }
    }
  }

  List<EnrolledCoursesModel> _filterCoursesByStatus(
      List<EnrolledCoursesModel> courses, String status) {
    final now = DateTime.now();

    return courses.where((enrolledCourse) {
      final course = enrolledCourse.course;
      final isAccepted = enrolledCourse.status;
      final endDate = course.courseEndDate.toDate();

      switch (status) {
        case 'In Progress':
          return isAccepted == true && endDate.isAfter(now);
        case 'Completed':
          return isAccepted == true && endDate.isBefore(now);
        case 'Pending':
          return isAccepted == null;
        case 'Rejected':
          return isAccepted == false;
        default:
          return true;
      }
    }).toList();
  }

  String getCourseStatusString(CourseModel course, bool? isAccepted) {
    final now = DateTime.now();
    final endDate = course.courseEndDate.toDate();

    if (isAccepted == null) {
      return 'Pending';
    } else if (isAccepted == false) {
      return 'Rejected';
    } else if (endDate.isBefore(now)) {
      return 'Completed';
    } else {
      return 'In Progress';
    }
  }

  Future<List<EnrolledCoursesModel>> toEnrolledModel(
      List<CourseModel> courses, Map<String, dynamic> data) async {
    List<EnrolledCoursesModel> enrolledCourses = [];
    if (courses.isNotEmpty || data.isNotEmpty) {
      for (var course in courses) {
        final courseId = course.courseID;
        final status = data[courseId];
        final progressData = calculateCourseProgress(course);
        // ignore: unnecessary_nullable_for_final_variable_declarations
        final bool? isRated = await repo.isStudentRated(course.courseID!);

        enrolledCourses.add(
          EnrolledCoursesModel(
            course: course,
            status: status,
            progress: progressData['progress'],
            progressText: progressData['progressText'],
            isRated: isRated,
          ),
        );
      }
    }
    return enrolledCourses;
  }

  Map<String, dynamic> calculateCourseProgress(CourseModel course) {
    final now = DateTime.now();
    final startDate = course.courseStartDate.toDate();
    final endDate = course.courseEndDate.toDate();

    double progress = 0.0;
    String progressText = '0%';

    if (now.isAfter(startDate) && now.isBefore(endDate)) {
      final totalDuration = endDate.difference(startDate).inDays;
      final daysElapsed = now.difference(startDate).inDays;
      progress = daysElapsed / totalDuration;
      progress = progress.clamp(0.0, 1.0); // Ensure between 0 and 1
      progressText = '${(progress * 100).round()}%';
    } else if (now.isAfter(endDate)) {
      // Course completed
      progress = 1.0;
      progressText = '100%';
    }

    return {
      'progress': progress,
      'progressText': progressText,
    };
  }

  @override
  Future<void> close() {
    _coursesSubscription?.cancel();
    return super.close();
  }
}
