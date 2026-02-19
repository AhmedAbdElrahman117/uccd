import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Components/dialog_overlay.dart';
import 'package:uccd/Core/Models/category_model.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/Models/post_model.dart';
import 'package:uccd/Core/Models/student_model.dart';
import 'package:uccd/Core/Models/user_model.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Archive/admin_archive_course_menu.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/admin_course_menu.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/attendance_view.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/change_category_view.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/change_instructor_view.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/student_all_info_view.dart';
import 'package:uccd/Features/Community/Presentation/Views/add_post_view.dart';
import 'package:uccd/Features/Profile/Presentation/Views/add_category_view.dart';
import 'package:uccd/Features/Profile/Presentation/Views/add_instructor_view.dart';

class OverlayController {
  static void showDeleteDialog(
    BuildContext context, {
    required String message,
    required void Function()? onConfirm,
  }) async {
    await showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.88),
      transitionDuration: const Duration(milliseconds: 300),
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, animation, secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: DialogOverlay(
            image: 'assets/lotties/delete.json',
            title: 'Delete',
            message: message,
            confirmButtonText: 'Delete',
            confirmButtonColor: Colors.redAccent.shade700,
            onCancel: () {
              context.pop();
            },
            onConfirm: onConfirm,
          ),
        );
      },
    );
  }

  static void showLogoutDialog(
    BuildContext context, {
    required String message,
    required void Function()? onConfirm,
  }) async {
    await showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.88),
      transitionDuration: const Duration(milliseconds: 300),
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, animation, secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: DialogOverlay(
            image: 'assets/lotties/logout.json',
            title: 'Logout',
            message: message,
            confirmButtonText: 'Logout',
            confirmButtonColor: Colors.red,
            onCancel: () {
              context.pop();
            },
            onConfirm: onConfirm,
          ),
        );
      },
    );
  }

  static void showAddInstructorDialog(BuildContext context,
      [UserModel? instructor]) async {
    await showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.88),
      transitionDuration: const Duration(milliseconds: 300),
      barrierDismissible: false,
      pageBuilder: (context, animation, secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: AddInstructorView(
            currentInstructor: instructor,
          ),
        );
      },
    );
  }

  static void showAddCategoryDialog(BuildContext context,
      [CategoryModel? category]) async {
    await showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.88),
      transitionDuration: const Duration(milliseconds: 300),
      barrierDismissible: false,
      pageBuilder: (context, animation, secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: AddCategoryView(
            category: category,
          ),
        );
      },
    );
  }

  static void showAddPostDialog(BuildContext context, [PostModel? post]) async {
    await showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.88),
      transitionDuration: const Duration(milliseconds: 300),
      barrierDismissible: false,
      pageBuilder: (context, animation, secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: AddPostView(
            post: post,
          ),
        );
      },
    );
  }

  static void showStudentInfoDialog(
    BuildContext context,
    StudentModel student,
  ) async {
    await showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.88),
      transitionDuration: const Duration(milliseconds: 300),
      barrierDismissible: true,
      barrierLabel: 'StudentInfo',
      pageBuilder: (context, animation, secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: StudentAllInfoView(
            student: student,
          ),
        );
      },
    );
  }

  static void showAvailableCourseMenu(
      BuildContext context, CourseModel course) async {
    await showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.88),
      transitionDuration: const Duration(milliseconds: 300),
      barrierDismissible: true,
      barrierLabel: 'StudentInfo',
      pageBuilder: (context, animation, secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: AdminCourseMenu(
            course: course,
          ),
        );
      },
    );
  }

  static void showChangeInstructor(
      BuildContext context, CourseModel course) async {
    await showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.88),
      transitionDuration: const Duration(milliseconds: 300),
      barrierDismissible: true,
      barrierLabel: 'StudentInfo',
      pageBuilder: (context, animation, secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: ChangeInstructorView(
            course: course,
          ),
        );
      },
    );
  }

  static void showChangeCategory(
      BuildContext context, CourseModel course) async {
    await showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.88),
      transitionDuration: const Duration(milliseconds: 300),
      barrierDismissible: true,
      barrierLabel: 'StudentInfo',
      pageBuilder: (context, animation, secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: ChangeCategoryView(
            course: course,
          ),
        );
      },
    );
  }

  static void showArchiveCourseMenu(
      BuildContext context, CourseModel course) async {
    await showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.88),
      transitionDuration: const Duration(milliseconds: 300),
      barrierDismissible: true,
      barrierLabel: 'Student Info',
      pageBuilder: (context, animation, secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: AdminArchiveCourseMenu(
            course: course,
          ),
        );
      },
    );
  }

  static void showStudentAttendance(
      BuildContext context, StudentModel student) async {
    await showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.88),
      transitionDuration: const Duration(milliseconds: 300),
      barrierDismissible: true,
      barrierLabel: 'Student Info',
      pageBuilder: (context, animation, secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: AttendanceView(
            student: student,
          ),
        );
      },
    );
  }
}
