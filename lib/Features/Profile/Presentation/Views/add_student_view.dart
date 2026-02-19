import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Components/custom_app_bar.dart';
import 'package:uccd/Core/Components/custom_loading_indicator.dart';
import 'package:uccd/Core/Models/user_model.dart';
import 'package:uccd/Core/app_banners.dart';
import 'package:uccd/Core/app_exception.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Add%20Student%20Cubit/add_student_cubit.dart';
import 'package:uccd/Features/Profile/Presentation/Views%20Model/Add%20Student%20Cubit/add_student_states.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Students/add_student_button.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Students/student_department_menu.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Students/student_email_field.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Students/student_name_field.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Students/student_national_id_field.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Students/student_password_field.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Students/student_university_id_field.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Students/students_year_menu.dart';
import 'package:uccd/generated/l10n.dart';

class AddStudentView extends StatefulWidget {
  const AddStudentView({super.key, this.student});

  static const String id = '/AddStudentView';
  final UserModel? student;

  @override
  State<AddStudentView> createState() => _AddStudentViewState();
}

class _AddStudentViewState extends State<AddStudentView> {
  final GlobalKey<FormState> studentFormKey = GlobalKey();
  late TextEditingController studentName;
  late TextEditingController studentEmail;
  late TextEditingController studentPassword;
  late TextEditingController studentuniversityId;
  late TextEditingController studentDepartment;
  late TextEditingController studentYear;
  late TextEditingController studentNationalId;

  @override
  void initState() {
    studentName = TextEditingController(
      text: widget.student?.name ?? 'scaa',
    );
    studentEmail = TextEditingController(
      text: widget.student?.email ?? 'ahmde@btu.edu.eg',
    );
    studentPassword = TextEditingController(
      text: widget.student?.password ?? '12345678',
    );
    studentuniversityId = TextEditingController(
      text: widget.student?.universityID ?? '123456789',
    );
    studentDepartment = TextEditingController(
      text: widget.student?.department,
    );
    studentYear = TextEditingController(
      text: widget.student?.year,
    );
    studentNationalId = TextEditingController(
      text: widget.student?.nationalID ?? '12345678912345',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddStudentCubit(),
      child: BlocListener<AddStudentCubit, AddStudentStates>(
        listener: _listener,
        child: Stack(
          children: [
            Scaffold(
              appBar: CustomAppBar(
                title: widget.student == null
                    ? S.of(context).addStudentTitle
                    : S.of(context).editStudentTitle,
              ),
              body: Form(
                key: studentFormKey,
                child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Column(
                    spacing: 24,
                    children: [
                      StudentNameField(
                        studentName: studentName,
                      ),
                      StudentEmailField(
                        isEditable: widget.student == null,
                        studentName: studentEmail,
                      ),
                      StudentPasswordField(
                        studentPassword: studentPassword,
                      ),
                      StudentUniversityIdField(
                        studentuniversityId: studentuniversityId,
                      ),
                      StudentNationalIdField(
                        studentNationalId: studentNationalId,
                      ),
                      StudentDepartmentMenu(
                        departmentController: studentDepartment,
                      ),
                      StudentYearMenu(
                        yearController: studentYear,
                      ),
                      AddStudentButton(
                        formKey: studentFormKey,
                        studentName: studentName,
                        studentEmail: studentEmail,
                        studentPassword: studentPassword,
                        studentDepartment: studentDepartment,
                        studentNationalId: studentNationalId,
                        studentYear: studentYear,
                        studentuniversityId: studentuniversityId,
                        isAdd: widget.student == null,
                        currentStudent: widget.student,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BlocSelector<AddStudentCubit, AddStudentStates, bool>(
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

  void _listener(BuildContext context, AddStudentStates state) {
    if (state is AddUpdateSuccess) {
      AppBanners.showSuccess(
        message: AppException.getLocalizedMessage(
          state.successMessage,
          context,
        ),
      );
      context.pop();
    } else if (state is AddUpdateFailed) {
      AppBanners.showFailed(
        message: AppException.getLocalizedMessage(
          state.errorMessage,
          context,
        ),
      );
    }
  }
}
