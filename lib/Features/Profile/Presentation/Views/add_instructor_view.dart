import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Components/custom_loading_indicator.dart';
import 'package:uccd/Core/Components/overlay_background.dart';
import 'package:uccd/Core/Components/section_title.dart';
import 'package:uccd/Core/Models/user_model.dart';
import 'package:uccd/Core/app_banners.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Add%20Instructor%20Cubit/add_instructor_cubit.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Add%20Instructor%20Cubit/add_instructor_states.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Instructors/add_instructor_button.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Instructors/instructor_email_field.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Instructors/instructor_name_field.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Instructors/instructor_password_field.dart';
import 'package:uccd/generated/l10n.dart';

class AddInstructorView extends StatefulWidget {
  const AddInstructorView({super.key, this.currentInstructor});

  final UserModel? currentInstructor;

  @override
  State<AddInstructorView> createState() => _AddInstructorViewState();
}

class _AddInstructorViewState extends State<AddInstructorView> {
  final GlobalKey<FormState> instructorFormKey = GlobalKey();
  late TextEditingController instructorName;
  late TextEditingController instructorEmail;
  late TextEditingController instructorPassword;

  @override
  void initState() {
    instructorName = TextEditingController(
      text: widget.currentInstructor?.name ?? 'scasc',
    );
    instructorEmail = TextEditingController(
      text: widget.currentInstructor?.email ?? "acas@btu.edu.eg",
    );
    instructorPassword = TextEditingController(
      text: widget.currentInstructor?.password ?? '12345678',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddInstructorCubit(),
      child: BlocListener<AddInstructorCubit, AddInstructorStates>(
        listener: _listener,
        child: Stack(
          children: [
            OverlayBackground(
              child: Form(
                key: instructorFormKey,
                child: Column(
                  spacing: 20,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SectionTitle(
                      title: widget.currentInstructor == null
                          ? S.of(context).addInstructorTitle
                          : S.of(context).editInstructorTitle,
                    ),
                    InstructorNameField(
                      instructorName: instructorName,
                    ),
                    InstructorEmailField(
                      isEditable: widget.currentInstructor == null,
                      instructorEmail: instructorEmail,
                    ),
                    InstructorPasswordField(
                      instructorPassword: instructorPassword,
                    ),
                    AddInstructorButton(
                      formKey: instructorFormKey,
                      instructorName: instructorName,
                      instructorEmail: instructorEmail,
                      instructorPassword: instructorPassword,
                      currentInstructor: widget.currentInstructor,
                    ),
                  ],
                ),
              ),
            ),
            BlocSelector<AddInstructorCubit, AddInstructorStates, bool>(
              selector: (state) {
                if (state is AddUpdateLoading) {
                  return true;
                }
                return false;
              },
              builder: (context, state) {
                return CustomLoadingIndicator(
                  isLoading: state,
                  child: const SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _listener(BuildContext context, AddInstructorStates state) {
    if (state is AddUpdateSuccess) {
      AppBanners.showSuccess(
        message: state.successMessage,
      );
      context.pop();
    } else if (state is AddUpdateFailed) {
      AppBanners.showFailed(
        message: state.errorMessage,
      );
    }
  }
}
