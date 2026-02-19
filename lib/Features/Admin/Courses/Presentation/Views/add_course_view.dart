import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jiffy/jiffy.dart';
import 'package:uccd/Core/Components/custom_loading_indicator.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/app_banners.dart';
import 'package:uccd/Core/app_exception.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Core/constants.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Add%20Course%20Cubit/add_course_cubit.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Add%20Course%20Cubit/add_course_states.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Add%20Course/add_course_pages.dart';
import 'package:uccd/Core/Components/page_indicator.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Add%20Course/next_previous_add_buttons.dart';
import 'package:uccd/generated/l10n.dart';

class AddCourseView extends StatefulWidget {
  const AddCourseView({super.key, this.currentCourse});

  static const String id = '/AddCourseView';
  final CourseModel? currentCourse;

  @override
  State<AddCourseView> createState() => _AddCourseViewState();
}

class _AddCourseViewState extends State<AddCourseView> {
  final GlobalKey<FormState> _infoKey = GlobalKey();
  final GlobalKey<FormState> _goalsKey = GlobalKey();
  final GlobalKey<FormState> _datesKey = GlobalKey();
  final GlobalKey<FormState> _prequesetsKey = GlobalKey();
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController instructorController;
  late TextEditingController instructorIDController;
  late TextEditingController categoryController;
  late TextEditingController categoryIDController;
  late TextEditingController classController;
  late TextEditingController durationController;
  late TextEditingController courseStartController;
  late TextEditingController courseEndController;
  late TextEditingController interviewStartController;
  late TextEditingController interviewEndController;
  late TextEditingController acceptedStudentsController;
  final TextEditingController imagePath = TextEditingController();
  late List<TextEditingController> goalsController;
  final PageController pageController = PageController();
  late List<TextEditingController> prerequestsController;

  @override
  void initState() {
    titleController = TextEditingController(
      text: widget.currentCourse?.title,
    );
    descriptionController = TextEditingController(
      text: widget.currentCourse?.description,
    );

    instructorController = TextEditingController(
      text: widget.currentCourse?.instructor,
    );

    instructorIDController = TextEditingController(
      text: widget.currentCourse?.instructorID,
    );

    categoryController = TextEditingController(
      text: widget.currentCourse?.category,
    );

    categoryIDController = TextEditingController(
      text: widget.currentCourse?.categoryID,
    );

    classController = TextEditingController(
      text: widget.currentCourse?.roomNumber.toString(),
    );

    durationController = TextEditingController(
      text: widget.currentCourse?.duration.toString(),
    );

    acceptedStudentsController = TextEditingController(
      text: widget.currentCourse?.maxAcceptedStudents.toString(),
    );

    courseStartController = TextEditingController(
      text: widget.currentCourse == null
          ? ''
          : Jiffy.parseFromMillisecondsSinceEpoch(
              widget.currentCourse!.courseStartDate.millisecondsSinceEpoch,
            ).format(pattern: dateFormat),
    );

    courseEndController = TextEditingController(
      text: widget.currentCourse == null
          ? ''
          : Jiffy.parseFromMillisecondsSinceEpoch(
              widget.currentCourse!.courseEndDate.millisecondsSinceEpoch,
            ).format(pattern: dateFormat),
    );

    interviewStartController = TextEditingController(
      text: widget.currentCourse == null
          ? ''
          : Jiffy.parseFromMillisecondsSinceEpoch(
              widget.currentCourse!.interviewStartDate.millisecondsSinceEpoch,
            ).format(pattern: dateFormat),
    );

    interviewEndController = TextEditingController(
      text: widget.currentCourse == null
          ? ''
          : Jiffy.parseFromMillisecondsSinceEpoch(
              widget.currentCourse!.interviewEndDate.millisecondsSinceEpoch,
            ).format(pattern: dateFormat),
    );

    goalsController = widget.currentCourse == null
        ? [TextEditingController()]
        : List.generate(
            widget.currentCourse!.courseGoals!.length,
            (index) {
              return TextEditingController(
                text: widget.currentCourse!.courseGoals![index],
              );
            },
          );

    prerequestsController = widget.currentCourse == null
        ? [TextEditingController()]
        : List.generate(
            widget.currentCourse!.coursePrerequests?.length ?? 1,
            (index) {
              return TextEditingController(
                text: widget.currentCourse!.coursePrerequests?[index] ??
                    'sakmklmsav',
              );
            },
          );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCourseCubit(),
      child: Builder(
        builder: (context) {
          return BlocListener<AddCourseCubit, AddCourseStates>(
            listener: _listener,
            child: Stack(
              children: [
                Scaffold(
                  appBar: AppBar(
                    title: Text(
                      widget.currentCourse == null
                          ? S.of(context).addCourseTitle
                          : S.of(context).editCourseTitle,
                      style: AppText.style20Bold(context),
                    ),
                  ),
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: AddCoursePages(
                          datesKey: _datesKey,
                          infoKey: _infoKey,
                          goalsKey: _goalsKey,
                          pageController: pageController,
                          titleController: titleController,
                          instructorController: instructorController,
                          instructorIDController: instructorIDController,
                          acceptedStudentsController:
                              acceptedStudentsController,
                          categoryController: categoryController,
                          categoryIDController: categoryIDController,
                          classController: classController,
                          descriptionController: descriptionController,
                          durationController: durationController,
                          courseStartController: courseStartController,
                          courseEndController: courseEndController,
                          interviewEndController: interviewEndController,
                          interviewStartController: interviewStartController,
                          goalsController: goalsController,
                          imagePath: imagePath,
                          currentCourse: widget.currentCourse,
                          prequesetsKey: _prequesetsKey,
                          prerequestsController: prerequestsController,
                        ),
                      ),
                      PageIndicator(
                        pageController: pageController,
                        pagesCount: 5,
                        onDotClicked: (index) {
                          BlocProvider.of<AddCourseCubit>(context)
                              .animateToPage(
                            pageController,
                            index,
                          );
                        },
                      ),
                      NextPreviousAddButtons(
                        pageController: pageController,
                        infoKey: _infoKey,
                        datesKey: _datesKey,
                        goalsKey: _goalsKey,
                        prequesetsKey: _prequesetsKey,
                        titleController: titleController,
                        descriptionController: descriptionController,
                        instructorController: instructorController,
                        instructorIDController: instructorIDController,
                        categoryIDController: categoryIDController,
                        categoryController: categoryController,
                        classController: classController,
                        durationController: durationController,
                        courseStartController: courseStartController,
                        courseEndController: courseEndController,
                        interviewStartController: interviewStartController,
                        interviewEndController: interviewEndController,
                        acceptedStudentsController: acceptedStudentsController,
                        imagePath: imagePath,
                        goalsController: goalsController,
                        currentCourse: widget.currentCourse,
                        prerequestsController: prerequestsController,
                      ),
                    ],
                  ),
                ),
                BlocSelector<AddCourseCubit, AddCourseStates, bool>(
                  selector: (state) {
                    if (state is AddUpdateLoading) {
                      return true;
                    }
                    return false;
                  },
                  builder: (context, state) {
                    return CustomLoadingIndicator(
                      isLoading: state,
                      child: const SizedBox(),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _listener(BuildContext context, AddCourseStates state) {
    if (state is AddUpdateSuccess) {
      if (state.isAdd == false) {
        context.pop();
        context.pop();
      } else {
        context.pop();
      }
      AppBanners.showSuccess(
        message: AppException.getLocalizedMessage(
          state.successMessage,
          context,
        ),
      );
    } else if (state is AddUpdateFailed) {
      final localizedError = AppException.getLocalizedMessage(
        state.errorMessage,
        context,
      );
      showDialog(
        context: context,
        builder: (context) {
          return Material(
            child: Center(
              child: Text(
                localizedError,
                style: AppText.style16Regular(context),
              ),
            ),
          );
        },
      );
      AppBanners.showFailed(message: localizedError);
    }
  }
}
