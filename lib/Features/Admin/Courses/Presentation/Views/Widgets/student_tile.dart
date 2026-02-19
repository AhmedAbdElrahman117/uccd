import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/user_model.dart';
import 'package:uccd/Core/app_assets.dart';

class StudentTile extends StatelessWidget {
  const StudentTile({
    super.key,
    required this.student,
  });

  final UserModel student;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: AssetImage(
          AppAssets.imagesUCCDGrouplogo2,
        ),
      ),
      title: Text(student.name),
      subtitle: Column(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(student.email),
          Text(student.department ?? ''),
          Text(student.year ?? ''),
        ],
      ),
    );
  }
}
