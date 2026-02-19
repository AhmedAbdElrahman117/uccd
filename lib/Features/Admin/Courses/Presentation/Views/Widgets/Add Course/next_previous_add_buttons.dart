import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Add%20Course%20Cubit/add_course_cubit.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Add%20Course%20Cubit/add_course_states.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Add%20Course/add_course_button.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Add%20Course/next_page_button.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Add%20Course/previous_page_button.dart';

class NextPreviousAddButtons extends StatefulWidget {
  const NextPreviousAddButtons({
    super.key,
    required this.pageController,
    required GlobalKey<FormState> infoKey,
    required GlobalKey<FormState> datesKey,
    required this.titleController,
    required this.descriptionController,
    required this.instructorController,
    required this.categoryController,
    required this.classController,
    required this.durationController,
    required this.courseStartController,
    required this.courseEndController,
    required this.interviewStartController,
    required this.interviewEndController,
    required this.acceptedStudentsController,
    required this.imagePath,
    required this.goalsController,
    required this.goalsKey,
    required this.instructorIDController,
    required this.categoryIDController,
    this.currentCourse,
    required this.prequesetsKey,
    required this.prerequestsController,
  })  : _infoKey = infoKey,
        _datesKey = datesKey;

  final PageController pageController;
  final GlobalKey<FormState> _infoKey;
  final GlobalKey<FormState> _datesKey;
  final GlobalKey<FormState> goalsKey;
  final GlobalKey<FormState> prequesetsKey;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController instructorIDController;
  final TextEditingController instructorController;
  final TextEditingController categoryController;
  final TextEditingController categoryIDController;
  final TextEditingController classController;
  final TextEditingController durationController;
  final TextEditingController courseStartController;
  final TextEditingController courseEndController;
  final TextEditingController interviewStartController;
  final TextEditingController interviewEndController;
  final TextEditingController acceptedStudentsController;
  final List<TextEditingController> goalsController;
  final TextEditingController imagePath;
  final CourseModel? currentCourse;
  final List<TextEditingController> prerequestsController;

  @override
  State<NextPreviousAddButtons> createState() => _NextPreviousAddButtonsState();
}

class _NextPreviousAddButtonsState extends State<NextPreviousAddButtons> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddCourseCubit, AddCourseStates>(
      listener: (context, state) {
        if (state is PageChanged) {
          index = state.index;
        }
      },
      buildWhen: (previous, current) {
        return current is PageChanged;
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(
            bottom: 40,
            left: 20,
            right: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PreviousPageButton(
                isZero: index == 0,
                onPressed: () async {
                  BlocProvider.of<AddCourseCubit>(context).previousPage(
                    widget.pageController,
                  );
                },
              ),
              Visibility(
                visible: index != 4,
                replacement: AddCourseButton(
                  infoKey: widget._infoKey,
                  datesKey: widget._datesKey,
                  prequesetsKey: widget.prequesetsKey,
                  pageController: widget.pageController,
                  titleController: widget.titleController,
                  descriptionController: widget.descriptionController,
                  instructorController: widget.instructorController,
                  instructorIDController: widget.instructorIDController,
                  categoryIDController: widget.categoryIDController,
                  categoryController: widget.categoryController,
                  classController: widget.classController,
                  durationController: widget.durationController,
                  courseStartController: widget.courseStartController,
                  courseEndController: widget.courseEndController,
                  interviewStartController: widget.interviewStartController,
                  interviewEndController: widget.interviewEndController,
                  acceptedStudentsController: widget.acceptedStudentsController,
                  pickedImage: widget.imagePath.text.isNotEmpty
                      ? XFile(widget.imagePath.text)
                      : null,
                  goalsController: widget.goalsController,
                  imagePath: widget.imagePath,
                  goalsKey: widget.goalsKey,
                  currentCourse: widget.currentCourse,
                  prerequestsController: widget.prerequestsController,
                ),
                child: NextPageButton(
                  onPressed: () {
                    BlocProvider.of<AddCourseCubit>(context).nextPage(
                      widget.pageController,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
