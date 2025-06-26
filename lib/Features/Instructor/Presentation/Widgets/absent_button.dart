import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/student_model.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Core/Enums/attendance_status.dart';
import 'package:uccd/generated/l10n.dart';

class AbsentButton extends StatelessWidget {
  const AbsentButton({
    super.key,
    required this.student,
    required this.attendanceStatus,
    this.isLoading = false,
    required this.onAbsentToggle,
  });

  final StudentModel student;
  final AttendanceStatus attendanceStatus;
  final bool isLoading;
  final VoidCallback? onAbsentToggle;
  @override
  Widget build(BuildContext context) {
    final isAbsent = attendanceStatus.isAbsent;
    final isUnmarked = attendanceStatus.isUnmarked;
    final isDisabled = isLoading;

    return OutlinedButton.icon(
      onPressed: isDisabled ? null : onAbsentToggle,
      icon: isLoading
          ? SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  isAbsent ? Colors.red : Colors.grey,
                ),
              ),
            )
          : Icon(
              Icons.cancel,
              size: 16,
              color: isAbsent ? Colors.red : Colors.grey,
            ),
      label: Text(
        S.of(context).Absent,
        style: AppText.style14Regular(context).copyWith(
          color: isAbsent ? Colors.red : Colors.grey,
        ),
      ),
      style: OutlinedButton.styleFrom(
        backgroundColor: isAbsent
            ? Colors.red[50]
            : isUnmarked
                ? null
                : Colors.grey[100],
        foregroundColor: isAbsent ? Colors.red : Colors.grey,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        minimumSize: const Size(90, 36),
        side: BorderSide(
          color: isAbsent ? Colors.red : Colors.grey,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
