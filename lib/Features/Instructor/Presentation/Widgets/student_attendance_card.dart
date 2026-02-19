// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/student_model.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Core/Enums/attendance_status.dart';
import 'package:uccd/Features/Instructor/Presentation/Widgets/absent_button.dart';
import 'package:uccd/Features/Instructor/Presentation/Widgets/present_button.dart';
import 'package:uccd/generated/l10n.dart';

class StudentAttendanceCard extends StatelessWidget {
  const StudentAttendanceCard({
    super.key,
    required this.student,
    required this.attendanceStatus,
    this.isLoading = false,
    this.onPresentToggle,
    this.onAbsentToggle,
  });

  final StudentModel student;
  final AttendanceStatus attendanceStatus;
  final bool isLoading;
  final VoidCallback? onPresentToggle;
  final VoidCallback? onAbsentToggle;
  @override
  Widget build(BuildContext context) {
    // Get status indicator colors
    Color statusColor;
    String statusText;
    switch (attendanceStatus) {
      case AttendanceStatus.present:
        statusColor = Colors.green;
        statusText = 'Present';
        break;
      case AttendanceStatus.absent:
        statusColor = Colors.red;
        statusText = 'Absent';
        break;
      case AttendanceStatus.unmarked:
        statusColor = Colors.grey;
        statusText = 'Unmarked';
        break;
    }

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: statusColor.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Student Avatar with status indicator
            Stack(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: AppColor.primary.withAlpha(192),
                  child: Text(
                    (student.name?.isNotEmpty == true
                            ? student.name!.substring(0, 2)
                            : 'ST')
                        .toUpperCase(),
                    style: AppText.style14Bold(context).copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                // Status indicator
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: statusColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      attendanceStatus.isPresent
                          ? Icons.check
                          : attendanceStatus.isAbsent
                              ? Icons.close
                              : Icons.help_outline,
                      size: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(width: 16),

            // Student Info
            Expanded(
              child: Column(
                spacing: 6,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    student.name ?? 'Unknown Student',
                    style: AppText.style16Bold(context),
                  ),
                  Text(
                    student.department ?? 'Department not specified',
                    style: AppText.style14Regular(context).copyWith(
                      color: Colors.grey[600],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          student.email ?? 'No email provided',
                          style: AppText.style14Regular(context).copyWith(
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Status badge
                      Visibility(
                        visible: attendanceStatus == AttendanceStatus.unmarked,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: statusColor.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: statusColor.withValues(alpha: 0.3),
                            ),
                          ),
                          child: Text(
                            S.of(context).Unmarked,
                            style: AppText.style12Regular(context).copyWith(
                              color: statusColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16), // Attendance Buttons
            Column(
              spacing: 8,
              children: [
                // Present Button
                PresentButton(
                  student: student,
                  attendanceStatus: attendanceStatus,
                  isLoading: isLoading,
                  onPresentToggle: onPresentToggle,
                ),
                AbsentButton(
                  student: student,
                  attendanceStatus: attendanceStatus,
                  isLoading: isLoading,
                  onAbsentToggle: onAbsentToggle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
