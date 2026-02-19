import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Components/custom_button.dart';
import 'package:uccd/Core/Components/custom_loading_indicator.dart';
import 'package:uccd/Core/Components/overlay_background.dart';
import 'package:uccd/Core/Components/section_title.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/app_banners.dart';
import 'package:uccd/Core/app_exception.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Add%20Course%20Cubit/add_course_cubit.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Add%20Course%20Cubit/add_course_states.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Add%20Course/category_menu_field.dart';
import 'package:uccd/generated/l10n.dart';

class ChangeCategoryView extends StatefulWidget {
  const ChangeCategoryView({super.key, required this.course});

  final CourseModel course;

  @override
  State<ChangeCategoryView> createState() => _ChangeCategoryViewState();
}

class _ChangeCategoryViewState extends State<ChangeCategoryView> {
  late TextEditingController categoryController;
  late TextEditingController categoryIDController;

  @override
  void initState() {
    categoryController = TextEditingController(
      text: widget.course.category,
    );
    categoryIDController = TextEditingController(
      text: widget.course.categoryID,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCourseCubit.getCategories(widget.course),
      child: BlocConsumer<AddCourseCubit, AddCourseStates>(
        listener: (context, state) {
          if (state is AddUpdateSuccess) {
            context.pop();
            context.pop();
            AppBanners.showSuccess(
              message: AppException.getLocalizedMessage(
                state.successMessage,
                context,
              ),
            );
          }
          if (state is AddUpdateFailed) {
            AppBanners.showFailed(
              message: AppException.getLocalizedMessage(
                state.errorMessage,
                context,
              ),
            );
          }
        },
        builder: (context, state) {
          return CustomLoadingIndicator(
            isLoading: state is AddUpdateLoading,
            child: OverlayBackground(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 16,
                children: [
                  SectionTitle(
                    title: S.of(context).changeCategory,
                  ),
                  CategoryMenuField(
                    categoryController: categoryController,
                    categoryIDController: categoryIDController,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      left: 20,
                      right: 20,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        title: S.of(context).change,
                        onPressed: () async {
                          BlocProvider.of<AddCourseCubit>(context)
                              .changeCategory(
                            course: widget.course,
                            newCategoryName: categoryController.text,
                            oldCategoryID: widget.course.categoryID,
                            newCategoryID: categoryIDController.text,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
