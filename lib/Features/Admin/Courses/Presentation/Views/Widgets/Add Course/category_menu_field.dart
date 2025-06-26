import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Add%20Course%20Cubit/add_course_cubit.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Add%20Course%20Cubit/add_course_states.dart';
import 'package:uccd/generated/l10n.dart';

class CategoryMenuField extends StatefulWidget {
  const CategoryMenuField({
    super.key,
    required this.categoryController,
    required this.categoryIDController,
    this.enabled = true,
  });

  final TextEditingController categoryController;
  final TextEditingController categoryIDController;
  final bool? enabled;

  @override
  State<CategoryMenuField> createState() => _CategoryMenuFieldState();
}

class _CategoryMenuFieldState extends State<CategoryMenuField> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddCourseCubit, AddCourseStates>(
      buildWhen: (previous, current) {
        return current is DataEmpty ||
            current is DataFailed ||
            current is DataLoading ||
            current is CategoriesLoaded;
      },
      builder: (context, state) {
        return DropdownButtonFormField(
          value: widget.categoryIDController.text.isNotEmpty
              ? widget.categoryIDController.text
              : null,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.person),
            hintText: state is DataLoading
                ? S.of(context).loadingText
                : state is DataFailed
                    ? state.errorMessage
                    : state is DataEmpty
                        ? S.of(context).noCategoriesRegistered
                        : state is CategoriesLoaded
                            ? S.of(context).categoriesLabel
                            : '',
            enabled: state is CategoriesLoaded && widget.enabled!,
          ),
          items: state is CategoriesLoaded
              ? state.categories
                  .asMap()
                  .entries
                  .map(
                    (e) => DropdownMenuItem(
                      value: e.value.id,
                      child: Text(e.value.name),
                    ),
                  )
                  .toList()
              : null,
          onChanged: widget.enabled!
              ? (value) {
                  if (state is CategoriesLoaded) {
                    widget.categoryIDController.text = value! as String;
                    widget.categoryController.text = state.categories
                        .firstWhere(
                          (element) => element.id == value,
                        )
                        .name;
                  }
                }
              : null,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return S.of(context).selectCategory;
            }
            return null;
          },
        );
      },
    );
  }
}
