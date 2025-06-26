import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/student_model.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Core/Enums/attendance_status.dart';
import 'package:uccd/generated/l10n.dart';

class PresentButton extends StatelessWidget {
  const PresentButton({
    super.key,
    required this.student,
    required this.attendanceStatus,
    this.isLoading = false,
    required this.onPresentToggle,
  });

  final StudentModel student;
  final AttendanceStatus attendanceStatus;
  final bool isLoading;
  final VoidCallback? onPresentToggle;
  @override
  Widget build(BuildContext context) {
    final isPresent = attendanceStatus.isPresent;
    final isUnmarked = attendanceStatus.isUnmarked;
    final isDisabled = isLoading;

    return ElevatedButton.icon(
      onPressed: isDisabled ? null : onPresentToggle,
      icon: isLoading
          ? SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  isPresent ? Colors.white : Colors.green,
                ),
              ),
            )
          : Icon(
              Icons.check_circle,
              size: 16,
              color: isPresent ? Colors.white : Colors.green,
            ),
      label: Text(
        S.of(context).Present,
        style: AppText.style14Regular(context).copyWith(
          color: isPresent ? Colors.white : Colors.green,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: isPresent
            ? Colors.green
            : isUnmarked
                ? Colors.green[50]
                : Colors.grey[100],
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        minimumSize: const Size(90, 36),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
