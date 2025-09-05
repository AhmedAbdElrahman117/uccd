import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/user_model.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Instructors/instructor.dart';

class InstructorListView extends StatelessWidget {
  const InstructorListView({super.key, required this.instructors});

  final List<UserModel> instructors;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: instructors.length,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Instructor(
            instructor: instructors[index],
          ),
        );
      },
    );
  }
}
