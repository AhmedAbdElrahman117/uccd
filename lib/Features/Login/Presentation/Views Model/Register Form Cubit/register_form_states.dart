import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uccd/Core/Models/category_model.dart';

sealed class RegisterFormStates {}

class RegisterFormInitialState extends RegisterFormStates {}

class ChangePage extends RegisterFormStates {}

class DataLoading extends RegisterFormStates {}

class DataEmpty extends RegisterFormStates {}

class DataLoaded extends RegisterFormStates {
  final List<CategoryModel> categories;

  DataLoaded({required this.categories});
}

class DataFailed extends RegisterFormStates {
  final String errorMessage;

  DataFailed({required this.errorMessage});
}

class TermsAgreed extends RegisterFormStates {}

class TriggerSelection extends RegisterFormStates {}

class RegisterLoading extends RegisterFormStates {}

class RegisterSuccess extends RegisterFormStates {}

class RegisterFailed extends RegisterFormStates {
  final String id;
  final String phone;
  final Timestamp graduationYear;
  final String disability;
  final List<String> selectedCategories;
  final bool isAgree;

  RegisterFailed({
    required this.id,
    required this.phone,
    required this.graduationYear,
    required this.disability,
    required this.selectedCategories,
    required this.isAgree,
  });
}
