import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Components/data_error_widget.dart';
import 'package:uccd/Core/constants.dart';
import 'package:uccd/Features/User/Home/Presentation/Views%20Model/User%20Home%20Cubit/user_home_cubit.dart';
import 'package:uccd/Features/User/Home/Presentation/Views%20Model/User%20Home%20Cubit/user_home_states.dart';
import 'package:uccd/Features/User/user_view_test_widgets/courses_tab/widgets/course_category_filter.dart';
import 'package:uccd/Features/User/user_view_test_widgets/courses_tab/widgets/course_empty_state.dart';
import 'package:uccd/Features/User/user_view_test_widgets/courses_tab/widgets/course_grid.dart';
import 'package:uccd/Features/User/user_view_test_widgets/courses_tab/widgets/course_search_bar.dart';

class CoursesTab extends StatefulWidget {
  const CoursesTab({super.key});

  @override
  State<CoursesTab> createState() => _CoursesTabState();
}

class _CoursesTabState extends State<CoursesTab> {
  late UserHomeCubit _userHomeCubit;
  final TextEditingController _searchController = TextEditingController();
  List<String> _categories = []; // Store categories locally

  @override
  void initState() {
    super.initState();
    _userHomeCubit = UserHomeCubit();
    _userHomeCubit.filter('All');
  }

  @override
  void dispose() {
    _searchController.dispose();
    _userHomeCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor =
        isDarkMode ? const Color(0xFF1A1A1A) : const Color(0xFFF7F7F7);
    final textColor = isDarkMode ? Colors.white : Colors.black87;

    return BlocProvider(
      create: (context) => _userHomeCubit,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: BlocBuilder<UserHomeCubit, UserHomeStates>(
          builder: (context, state) {
            // Extract categories from state if available
            if (state is DataLoaded && state.categories.isNotEmpty) {
              _categories = state.categories.map((cat) => cat.name).toList();
            }

            return Column(
              children: [
                // Search bar
                CourseSearchBar(
                  controller: _searchController,
                  cubit: _userHomeCubit,
                  isDarkMode: isDarkMode,
                  textColor: textColor,
                ),
                CourseCategoryFilter(
                  categories: _categories,
                  cubit: _userHomeCubit,
                ),
                Expanded(
                  child: switch (state) {
                    InitialState() => const SizedBox(),
                    DataLoading() => Center(
                        child: mainLoading,
                      ),
                    DataFailed() => DataErrorWidget(
                        message: state.errorMessage,
                      ),
                    DataEmpty() => CourseEmptyState(
                        isDarkMode: isDarkMode,
                        textColor: textColor,
                        cubit: _userHomeCubit,
                        searchController: _searchController,
                        isFiltered: _userHomeCubit.isFiltered,
                      ),
                    DataLoaded() => CourseGrid(
                        courses: state.courses,
                        isDarkMode: isDarkMode,
                      ),
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
