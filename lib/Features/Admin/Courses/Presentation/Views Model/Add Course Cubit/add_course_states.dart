import 'package:uccd/Core/Models/category_model.dart';
import 'package:uccd/Core/Models/user_model.dart';

sealed class AddCourseStates {}

class DataLoading extends AddCourseStates {}

class DataEmpty extends AddCourseStates {}

class CategoriesLoaded extends AddCourseStates {
  final List<CategoryModel> categories;

  CategoriesLoaded({required this.categories});
}

class InstructorsLoaded extends AddCourseStates {
  final List<UserModel> instructors;

  InstructorsLoaded({required this.instructors});
}

class DataFailed extends AddCourseStates {
  final String errorMessage;

  DataFailed({required this.errorMessage});
}

class AddCourseInitialState extends AddCourseStates {}

class AddUpdateLoading extends AddCourseStates {}

class AddUpdateSuccess extends AddCourseStates {
  final String successMessage;
  final bool isAdd;

  AddUpdateSuccess({
    required this.successMessage,
    required this.isAdd,
  });
}

class AddUpdateFailed extends AddCourseStates {
  final String errorMessage;

  AddUpdateFailed({required this.errorMessage});
}

class PageChanged extends AddCourseStates {
  final int index;

  PageChanged({required this.index});
}
