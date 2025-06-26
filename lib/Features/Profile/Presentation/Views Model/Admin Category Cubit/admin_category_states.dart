import 'package:uccd/Core/Models/category_model.dart';

sealed class AdminCategoryStates {}

class CategoryInitialState extends AdminCategoryStates {}

class DataLoading extends AdminCategoryStates {}

class DataFailed extends AdminCategoryStates {
  final String errorMessage;

  DataFailed({required this.errorMessage});
}

class DataLoaded extends AdminCategoryStates {
  final List<CategoryModel> categories;

  DataLoaded({required this.categories});
}

class DataEmpty extends AdminCategoryStates {}

class DeleteLoading extends AdminCategoryStates {}

class DeleteSuccess extends AdminCategoryStates {
  final String successMessage;

  DeleteSuccess({required this.successMessage});
}

class DeleteFailed extends AdminCategoryStates {
  final String errorMessage;

  DeleteFailed({required this.errorMessage});
}
