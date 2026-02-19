import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/user_model.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Students/student.dart';

class StudentsListView extends StatelessWidget {
  const StudentsListView({
    super.key,
    required this.data,
  });

  final List<UserModel> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Student(
            student: data[index],
          ),
        );
      },
    );
  }
}

// if (entry != null) {
//             entry!.remove();
//             entry = null;
//             return Future.value(true);
//           } else {
//             return Future.value(false);
//           }
