import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Add%20Course%20Cubit/add_course_cubit.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Add%20Course%20Cubit/add_course_states.dart';
import 'package:uccd/generated/l10n.dart';

class InstructorMenuField extends StatefulWidget {
  const InstructorMenuField({
    super.key,
    required this.instructorController,
    required this.instructorIDController,
    this.enabled = true,
  });

  final TextEditingController instructorController;
  final TextEditingController instructorIDController;
  final bool? enabled;

  @override
  State<InstructorMenuField> createState() => _InstructorMenuFieldState();
}

class _InstructorMenuFieldState extends State<InstructorMenuField>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<AddCourseCubit, AddCourseStates>(
      buildWhen: (previous, current) {
        return current is DataEmpty ||
            current is DataFailed ||
            current is DataLoading ||
            current is InstructorsLoaded;
      },
      builder: (context, state) {
        return DropdownButtonFormField(
          value: widget.instructorIDController.text.isNotEmpty
              ? widget.instructorIDController.text
              : null,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.person),
            hintText: state is DataLoading
                ? S.of(context).loadingText
                : state is DataFailed
                    ? state.errorMessage
                    : state is DataEmpty
                        ? S.of(context).noInstructorsRegistered
                        : state is InstructorsLoaded
                            ? S.of(context).instructorsLabel
                            : '',
            enabled: state is InstructorsLoaded && widget.enabled!,
          ),
          items: state is InstructorsLoaded
              ? state.instructors
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
                  if (state is InstructorsLoaded) {
                    widget.instructorIDController.text = value! as String;
                    widget.instructorController.text =
                        state.instructors.firstWhere(
                      (element) {
                        return element.id == value;
                      },
                    ).name;
                  }
                }
              : null,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return S.of(context).selectOneInstructor;
            }
            return null;
          },
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
