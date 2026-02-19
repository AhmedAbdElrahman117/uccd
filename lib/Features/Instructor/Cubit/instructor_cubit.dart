import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Features/Instructor/Cubit/instructor_states.dart';
import 'package:uccd/Features/Instructor/Data/instructor_repo.dart';

class InstructorCubit extends Cubit<InstructorStates> {
  InstructorCubit() : super(InstructorInitialState());

  final InstructorRepo _repo = InstructorRepo();
  StreamSubscription? _coursesSubscription;
  StreamSubscription? _studentsSubscription;
  void getCourses() {
    if (isClosed) return;

    emit(InstructorCoursesLoading());
    _coursesSubscription = _repo.getInstructorCourses().listen(
      (courses) {
        if (!isClosed) {
          if (courses.isEmpty) {
            emit(InstructorCoursesEmpty());
          } else {
            emit(
              InstructorCoursesLoaded(courses: courses),
            );
          }
        }
      },
      onError: (error) {
        if (!isClosed) {
          emit(
            InstructorCoursesFailed(errorMessage: error.toString()),
          );
        }
      },
    );
  }

  void getCourseStudents(String courseId) {
    if (isClosed) return;

    emit(CourseStudentsLoading());
    _studentsSubscription = _repo.getCourseStudents(courseId).listen(
      (students) {
        if (!isClosed) {
          emit(
            InstructorStudentsLoaded(
              students: students,
            ),
          );
        }
      },
      onError: (error) {
        if (!isClosed) {
          emit(
            InstructorStudentsFailed(
              errorMessage: error.toString(),
            ),
          );
        }
      },
    );
  }

  Future<void> markStudentPresent({
    required String courseId,
    required String studentId,
    required Timestamp date,
  }) async {
    if (isClosed) return;

    emit(StudentAttendanceLoading());
    try {
      await _repo.studentPresent(
        courseID: courseId,
        studentID: studentId,
        date: date,
      );
      if (!isClosed) {
        emit(StudentAttendanceLoaded());
        // Refresh the students list to reflect updated attendance
        getCourseStudents(courseId);
      }
    } catch (error) {
      if (!isClosed) {
        emit(StudentAttendanceFailed(
          errorMessage: error.toString(),
        ));
      }
    }
  }

  Future<void> markStudentAbsent({
    required String courseId,
    required String studentId,
    required Timestamp date,
  }) async {
    if (isClosed) return;

    emit(StudentAttendanceLoading());
    try {
      await _repo.studentAbsent(
        courseID: courseId,
        studentID: studentId,
        date: date,
      );
      if (!isClosed) {
        emit(StudentAttendanceLoaded());
        // Refresh the students list to reflect updated attendance
        getCourseStudents(courseId);
      }
    } catch (error) {
      if (!isClosed) {
        emit(StudentAttendanceFailed(
          errorMessage: error.toString(),
        ));
      }
    }
  }

  Future<void> unmarkStudentAttendance({
    required String courseId,
    required String studentId,
    required Timestamp date,
  }) async {
    emit(StudentAttendanceLoading());
    try {
      await _repo.unmarkStudentAttendance(
        courseID: courseId,
        studentID: studentId,
        date: date,
      );
      emit(StudentAttendanceLoaded());
      // Refresh the students list to reflect updated attendance
      getCourseStudents(courseId);
    } catch (error) {
      emit(StudentAttendanceFailed(
        errorMessage: error.toString(),
      ));
    }
  }

  @override
  Future<void> close() {
    _coursesSubscription?.cancel();
    _studentsSubscription?.cancel();
    return super.close();
  }
}
