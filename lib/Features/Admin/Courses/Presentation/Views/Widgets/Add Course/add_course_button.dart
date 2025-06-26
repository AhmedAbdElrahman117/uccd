import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_dates.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Add%20Course%20Cubit/add_course_cubit.dart';
import 'package:uccd/generated/l10n.dart';

class AddCourseButton extends StatelessWidget {
  const AddCourseButton({
    super.key,
    required this.infoKey,
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
    this.pickedImage,
    required this.datesKey,
    required this.pageController,
    required this.goalsController,
    required this.imagePath,
    required this.goalsKey,
    required this.instructorIDController,
    required this.categoryIDController,
    this.currentCourse,
    required this.prequesetsKey,
    required this.prerequestsController,
  });
  final GlobalKey<FormState> goalsKey;
  final GlobalKey<FormState> infoKey;
  final GlobalKey<FormState> datesKey;
  final GlobalKey<FormState> prequesetsKey;
  final PageController pageController;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController instructorController;
  final TextEditingController instructorIDController;
  final TextEditingController categoryController;
  final TextEditingController categoryIDController;
  final TextEditingController classController;
  final TextEditingController durationController;
  final TextEditingController courseStartController;
  final TextEditingController courseEndController;
  final TextEditingController interviewStartController;
  final TextEditingController interviewEndController;
  final TextEditingController acceptedStudentsController;
  final XFile? pickedImage;
  final List<TextEditingController> goalsController;
  final TextEditingController imagePath;
  final CourseModel? currentCourse;
  final List<TextEditingController> prerequestsController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        if (infoKey.currentState!.validate() &&
            datesKey.currentState!.validate() &&
            prequesetsKey.currentState!.validate() &&
            goalsKey.currentState!.validate()) {
          CourseModel course = CourseModel(
            title: titleController.text,
            description: descriptionController.text,
            instructor: instructorController.text,
            instructorID: instructorIDController.text,
            category: categoryController.text,
            categoryID: categoryIDController.text,
            roomNumber: int.parse(
              classController.text,
            ),
            courseID: currentCourse?.courseID,
            createdAt: currentCourse?.createdAt,
            currentStudents: currentCourse?.currentStudents,
            imageLink: currentCourse?.imageLink,
            imageName: currentCourse?.imageName,
            duration: int.parse(durationController.text),
            courseStartDate: AppDates.stringToTimeStamp(
              courseStartController.text,
            ),
            courseEndDate: AppDates.stringToTimeStamp(
              courseEndController.text,
            ),
            interviewStartDate: AppDates.stringToTimeStamp(
              interviewStartController.text,
            ),
            interviewEndDate: AppDates.stringToTimeStamp(
              interviewEndController.text,
            ),
            maxAcceptedStudents: int.parse(
              acceptedStudentsController.text,
            ),
            courseGoals: List.generate(
              goalsController.length,
              (index) {
                return goalsController[index].text;
              },
            ),
            coursePrerequests: List.generate(
              prerequestsController.length,
              (index) {
                return prerequestsController[index].text;
              },
            ),
          );
          if (currentCourse == null) {
            BlocProvider.of<AddCourseCubit>(context).add(
              course: course,
              pickedImage:
                  imagePath.text.isEmpty ? null : XFile(imagePath.text),
            );
          } else {
            BlocProvider.of<AddCourseCubit>(context).updateInfo(
              newCourse: course,
              image: imagePath.text.isEmpty ? null : XFile(imagePath.text),
            );
          }
        } else {
          checkInvalidPage(context);
        }
      },
      label: Text(
        currentCourse == null
            ? S.of(context).addButtonLabel
            : S.of(context).editButtonLabel,
        style: AppText.style14Bold(context),
      ),
      icon: Icon(
        currentCourse == null
            ? FontAwesomeIcons.plus
            : FontAwesomeIcons.penToSquare,
        color: Theme.of(context).iconTheme.color,
      ),
      iconAlignment: IconAlignment.end,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
      ),
    );
  }

  void checkInvalidPage(BuildContext context) {
    if (infoKey.currentState!.validate() == false) {
      BlocProvider.of<AddCourseCubit>(context).jumpToPage(
        pageController,
        0,
      );
    } else if (goalsKey.currentState!.validate() == false) {
      BlocProvider.of<AddCourseCubit>(context).jumpToPage(
        pageController,
        1,
      );
    } else if (prequesetsKey.currentState!.validate() == false) {
      BlocProvider.of<AddCourseCubit>(context).jumpToPage(
        pageController,
        2,
      );
    } else if (datesKey.currentState!.validate() == false) {
      BlocProvider.of<AddCourseCubit>(context).jumpToPage(
        pageController,
        3,
      );
    }
  }
}
