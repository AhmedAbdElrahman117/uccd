import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/overlay_background.dart';
import 'package:uccd/Core/Models/student_model.dart';
import 'package:uccd/Core/app_text.dart';

class AttendanceView extends StatelessWidget {
  const AttendanceView({super.key, required this.student});

  final StudentModel student;

  @override
  Widget build(BuildContext context) {
    return OverlayBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 24,
          children: [
            const CircleAvatar(),
            Text(
              student.name!,
              style: AppText.style18Bold(context),
            ),
            Text(
              'Total: 6',
              style: AppText.style16Bold(context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Attended: 6',
                  style: AppText.style16Bold(context),
                ),
                Text(
                  'Absent: 0',
                  style: AppText.style16Bold(context),
                ),
              ],
            ),
            Text(
              'Absence Days',
              style: AppText.style16Bold(context),
            ),
            Column(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 12,
                  children: [
                    const Icon(
                      Icons.close,
                    ),
                    Text(
                      '11-05-2024',
                      style: AppText.style16Bold(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
