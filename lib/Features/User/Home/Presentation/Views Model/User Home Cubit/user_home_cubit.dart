import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uccd/Core/Models/category_model.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Features/Profile/Data/admin_category_repo.dart';
import 'package:uccd/Features/User/Home/Data/user_home_repo.dart';
import 'package:uccd/Features/User/Home/Presentation/Views%20Model/User%20Home%20Cubit/user_home_states.dart';

class UserHomeCubit extends Cubit<UserHomeStates> {
  UserHomeCubit() : super(InitialState()) {
    getCourses();
  }

  final UserHomeRepo repo = UserHomeRepo();
  final AdminCategoryRepo categoryRepo = AdminCategoryRepo();
  StreamSubscription? subscription;
  List<CourseModel> courses = [];
  List<CategoryModel> categories = [];
  String currentCategory = 'All';
  String searchQuery = '';

  bool get isFiltered => currentCategory != 'All' || searchQuery.isNotEmpty;

  void getCourses() {
    emit(DataLoading());
    subscription =
        Rx.combineLatest2(
          repo.getCourses(),
          categoryRepo.getCategories(),
          (a, b) => {'courses': a, 'categories': b},
        ).listen((event) {
          courses = event['courses'] as List<CourseModel>;
          categories = event['categories'] as List<CategoryModel>;
          event['courses']!.isEmpty
              ? emit(DataEmpty())
              : emit(
                  DataLoaded(
                    courses: event['courses'] as List<CourseModel>,
                    categories: event['categories'] as List<CategoryModel>,
                  ),
                );
        }, onError: (error) => DataFailed(errorMessage: error.toString()));
  }

  void filter(String option) {
    currentCategory = option;
    _applyFilters();
  }

  void search(String query) {
    searchQuery = query.toLowerCase();
    _applyFilters();
  }

  void resetFilters() {
    currentCategory = 'All';
    searchQuery = '';
    _applyFilters();
  }

  void _applyFilters() {
    var filteredCourses = courses;

    // Apply category filter
    if (currentCategory != 'All') {
      filteredCourses = filteredCourses
          .where((element) => element.category == currentCategory)
          .toList();
    }

    // Apply search filter
    if (searchQuery.isNotEmpty) {
      filteredCourses = filteredCourses
          .where(
            (course) =>
                course.title.toLowerCase().contains(searchQuery) ||
                course.instructor.toLowerCase().contains(searchQuery) ||
                course.category.toLowerCase().contains(searchQuery),
          )
          .toList();
    }

    if (filteredCourses.isEmpty) {
      emit(DataEmpty());
    } else {
      emit(DataLoaded(courses: filteredCourses, categories: categories));
    }
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
