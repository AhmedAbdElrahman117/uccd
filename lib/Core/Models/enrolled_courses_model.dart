import 'package:uccd/Core/Models/course_model.dart';

class EnrolledCoursesModel {
  final CourseModel course;
  final bool? status;
  final double progress;
  final String progressText;
  final bool? isRated;

  EnrolledCoursesModel({
    required this.course,
    required this.status,
    required this.progress,
    required this.progressText,
    this.isRated,
  });
}
