import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Components/dialog_overlay.dart';
import 'package:uccd/Core/Models/category_model.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/Models/post_model.dart';
import 'package:uccd/Core/Models/student_model.dart';
import 'package:uccd/Core/Models/user_model.dart';
import 'package:uccd/Core/app_assets.dart';
import 'package:uccd/generated/l10n.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Archive/admin_archive_course_menu.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/admin_course_menu.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/attendance_view.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/change_category_view.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/change_instructor_view.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/student_all_info_view.dart';
import 'package:uccd/Features/Community/Presentation/Views/Widgets/edit_post_dialog.dart';
import 'package:uccd/Features/Community/Presentation/Views/create_post_dialog.dart';
import 'package:uccd/Features/Profile/Presentation/Views/add_admin_view.dart';
import 'package:uccd/Features/Profile/Presentation/Views/add_category_view.dart';
import 'package:uccd/Features/Profile/Presentation/Views/add_instructor_view.dart';

class OverlayController {
  static void showDeleteDialog(
    BuildContext context, {
    required String message,
    required void Function()? onConfirm,
    String? image,
    Icon? confirmIcon,
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
            image: image ?? AppAssets.imagesDelete,
            title: S.of(context).deleteDialogTitle,
            message: message,
            confirmButtonText: S.of(context).deleteButtonText,
            confirmButtonColor: Colors.redAccent.shade700,
            onCancel: () {
              context.pop();
            },
            confirmIcon: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
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
    Icon? confirmIcon,
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
            title: S.of(context).logoutDialogTitle,
            message: message,
            confirmButtonText: S.of(context).logoutButtonText,
            confirmButtonColor: Colors.red,
            confirmIcon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
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
          child: const CreatePostDialog(),
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
    BuildContext context,
    StudentModel student,
    CourseModel course,
  ) async {
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
            course: course,
          ),
        );
      },
    );
  }

  // Add this method to your OverlayController class

  static void showAddAdminDialog(BuildContext context,
      [UserModel? user]) async {
    await showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.88),
      transitionDuration: const Duration(milliseconds: 300),
      barrierDismissible: false,
      pageBuilder: (context, animation, secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: AddAdminView(
            user: user,
          ),
        );
      },
    );
  }

  static void showCreatePostDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const CreatePostDialog(),
    );
  }

  static void confirmDelete(BuildContext context,
      {required Function onDelete}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(S.of(context).deletePostTitle),
        content: Text(S.of(context).deletePostConfirmMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(S.of(context).cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onDelete();
            },
            child: Text(
              S.of(context).deleteButtonText,
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  static void showEditDialog(BuildContext context, PostModel post) {
    showDialog(
      context: context,
      builder: (context) => EditPostDialog(
        post: post,
      ),
    );
  }

  static void showNoInternetDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(S.of(context).noInternetConnection),
        titlePadding: EdgeInsets.all(20),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            Image.asset(
              AppAssets.imagesNoWifi,
              height: 100,
              width: 100,
            ),
            Text(
              S.of(context).checkInternetConnection,
            )
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => SystemNavigator.pop(),
            child: Text(
              S.of(context).cancel,
            ),
          ),
        ],
      ),
    );
  }
}
