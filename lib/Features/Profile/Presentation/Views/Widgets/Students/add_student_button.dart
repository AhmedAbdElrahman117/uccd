import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Components/custom_button.dart';
import 'package:uccd/Core/Models/user_model.dart';
import 'package:uccd/Core/app_banners.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Add%20Student%20Cubit/add_student_cubit.dart';
import 'package:uccd/generated/l10n.dart';

class AddStudentButton extends StatelessWidget {
  const AddStudentButton({
    super.key,
    required this.formKey,
    required this.studentName,
    required this.studentEmail,
    required this.studentPassword,
    required this.studentuniversityId,
    required this.studentNationalId,
    required this.studentDepartment,
    required this.studentYear,
    required this.isAdd,
    this.currentStudent,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController studentName;
  final TextEditingController studentEmail;
  final TextEditingController studentPassword;
  final TextEditingController studentuniversityId;
  final TextEditingController studentNationalId;
  final TextEditingController studentDepartment;
  final TextEditingController studentYear;
  final bool isAdd;
  final UserModel? currentStudent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomButton(
        title: isAdd
            ? S.of(context).addButtonLabel
            : S.of(context).editButtonLabel,
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            UserModel newStudent = UserModel(
              name: studentName.text,
              email: studentEmail.text,
              password: studentPassword.text,
              role: 'Student',
              department: studentDepartment.text,
              nationalID: studentNationalId.text,
              universityID: studentuniversityId.text,
              year: studentYear.text,
              id: currentStudent?.id,
            );
            if (isAdd) {
              BlocProvider.of<AddStudentCubit>(context).add(
                student: newStudent,
              );
            } else {
              if (newStudent.compare(currentStudent!) == false) {
                BlocProvider.of<AddStudentCubit>(context).update(
                  currentStudent: currentStudent!,
                  newStudent: newStudent,
                );
              } else {
                context.pop();
                AppBanners.showFailed(
                  message: 'Nothing to Edit',
                );
              }
            }
          }
        },
      ),
    );
  }
}
