import 'package:uccd/Core/Models/course_model.dart';

sealed class ArchiveCourseStates {}

class ArchiveCourseInitialState extends ArchiveCourseStates {}

class DataLoading extends ArchiveCourseStates {}

class DataEmpty extends ArchiveCourseStates {}

class DataFailed extends ArchiveCourseStates {
  final String errorMessage;

  DataFailed({required this.errorMessage});
}

class DataLoaded extends ArchiveCourseStates {
  final List<CourseModel> archiveCourses;

  DataLoaded({required this.archiveCourses});
}
