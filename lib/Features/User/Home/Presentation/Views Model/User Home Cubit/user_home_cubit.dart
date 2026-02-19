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
  // Track current filter and search state
  String _currentCategory = 'All';
  String _currentSearchQuery = '';

  // Getter methods to access filtering state
  String get currentCategory => _currentCategory;
  String get currentSearchQuery => _currentSearchQuery;
  bool get isFiltered =>
      _currentSearchQuery.isNotEmpty || _currentCategory != 'All';

  void getCourses() {
    emit(DataLoading());
    subscription = Rx.combineLatest2(
      repo.getCourses(),
      categoryRepo.getCategories(),
      (a, b) => {
        'courses': a,
        'categories': b,
      },
    ).listen(
      (event) {
        courses = event['courses'] as List<CourseModel>;
        categories = event['categories'] as List<CategoryModel>;
        // Apply any existing filters once data is loaded
        _applyFilters();
      },
      onError: (error) => emit(DataFailed(
        errorMessage: error.toString(),
      )),
    );
  }

  // Filter by category
  void filter(String category) {
    _currentCategory = category;
    _applyFilters();
  }

  // Search with the given query
  void search(String query) {
    _currentSearchQuery = query;
    _applyFilters();
  }

  // Reset all filters
  void resetFilters() {
    _currentCategory = 'All';
    _currentSearchQuery = '';
    _applyFilters();
  }

  // Apply both category and search filters
  void _applyFilters() {
    // First filter by category
    List<CourseModel> filteredCourses = _currentCategory == 'All'
        ? courses
        : courses
            .where((course) => course.category == _currentCategory)
            .toList();

    // Then apply search if we have a query
    if (_currentSearchQuery.isNotEmpty) {
      filteredCourses = filteredCourses
          .where((course) =>
              course.title
                  .toLowerCase()
                  .contains(_currentSearchQuery.toLowerCase()) ||
              course.instructor
                  .toLowerCase()
                  .contains(_currentSearchQuery.toLowerCase()) ||
              course.description
                  .toLowerCase()
                  .contains(_currentSearchQuery.toLowerCase()))
          .toList();
    }

    // Emit appropriate state
    filteredCourses.isEmpty
        ? emit(DataEmpty())
        : emit(
            DataLoaded(
              courses: filteredCourses,
              categories: categories,
            ),
          );
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
