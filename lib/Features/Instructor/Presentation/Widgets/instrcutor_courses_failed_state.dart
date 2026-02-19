import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Features/Instructor/Cubit/instructor_cubit.dart';
import 'package:uccd/generated/l10n.dart';

class InstrcutorCoursesFailedState extends StatelessWidget {
  const InstrcutorCoursesFailedState({
    super.key,
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Colors.red,
          ),
          SizedBox(height: 16),
          Text(
            S.of(context).errorLoadingCourses,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.red,
                ),
          ),
          SizedBox(height: 8),
          Text(
            errorMessage,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.red,
                ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              context.read<InstructorCubit>().getCourses();
            },
            child: Text(S.of(context).retry),
          ),
        ],
      ),
    );
  }
}
