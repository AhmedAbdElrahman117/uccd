import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Components/custom_button.dart';
import 'package:uccd/Core/Models/user_model.dart';
import 'package:uccd/Core/app_banners.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Add%20Instructor%20Cubit/add_instructor_cubit.dart';
import 'package:uccd/generated/l10n.dart';

class AddInstructorButton extends StatelessWidget {
  const AddInstructorButton({
    super.key,
    required this.formKey,
    required this.instructorName,
    required this.instructorEmail,
    required this.instructorPassword,
    this.currentInstructor,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController instructorName;
  final TextEditingController instructorEmail;
  final TextEditingController instructorPassword;
  final UserModel? currentInstructor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomButton(
        title: currentInstructor == null
            ? S.of(context).addButtonLabel
            : S.of(context).editButtonLabel,
        onPressed: () {
          if (formKey.currentState!.validate()) {
            UserModel newInstructor = UserModel(
              name: instructorName.text,
              email: instructorEmail.text,
              password: instructorPassword.text,
              role: 'Instructor',
              id: currentInstructor?.id,
            );
            if (currentInstructor == null) {
              BlocProvider.of<AddInstructorCubit>(context).add(
                instructor: newInstructor,
              );
            } else {
              if (newInstructor.compare(currentInstructor!) == false) {
                BlocProvider.of<AddInstructorCubit>(context).update(
                  currentInstructor: currentInstructor!,
                  newInstructor: newInstructor,
                );
              } else {
                context.pop();
                AppBanners.showFailed(
                  message: 'No New Data to Update',
                );
              }
            }
          }
        },
      ),
    );
  }
}
