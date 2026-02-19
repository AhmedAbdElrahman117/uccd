import 'package:uccd/Core/Models/category_model.dart';
import 'package:uccd/Core/Models/course_model.dart';

sealed class UserHomeStates {}

class InitialState extends UserHomeStates {}

class DataLoading extends UserHomeStates {}

class DataFailed extends UserHomeStates {
  final String errorMessage;

  DataFailed({required this.errorMessage});
}

class DataLoaded extends UserHomeStates {
  final List<CourseModel> courses;
  final List<CategoryModel> categories;

  DataLoaded({required this.courses, required this.categories});
}

class DataEmpty extends UserHomeStates {}
