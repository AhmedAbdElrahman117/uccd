import 'package:uccd/Core/Models/student_model.dart';

abstract class InstructorStates {}

class InstructorInitialState extends InstructorStates {}

class InstructorCoursesLoading extends InstructorStates {}

class InstructorCoursesLoaded extends InstructorStates {
  InstructorCoursesLoaded({
    required this.courses,
  });

  final List<dynamic> courses;
}

class InstructorCoursesFailed extends InstructorStates {
  InstructorCoursesFailed({required this.errorMessage});

  final String errorMessage;
}

class InstructorCoursesEmpty extends InstructorStates {}

class CourseStudentsLoading extends InstructorStates {}

class InstructorStudentsLoaded extends InstructorStates {
  InstructorStudentsLoaded({
    required this.students,
  });

  final List<StudentModel> students;
}

class InstructorStudentsFailed extends InstructorStates {
  InstructorStudentsFailed({required this.errorMessage});

  final String errorMessage;
}

class InstructorStudentsEmpty extends InstructorStates {}

class StudentAttendanceLoading extends InstructorStates {}

class StudentAttendanceLoaded extends InstructorStates {}

class StudentAttendanceFailed extends InstructorStates {
  StudentAttendanceFailed({required this.errorMessage});

  final String errorMessage;
}
