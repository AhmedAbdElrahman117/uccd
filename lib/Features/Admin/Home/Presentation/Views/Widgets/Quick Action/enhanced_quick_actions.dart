import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Components/section_title.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/add_course_view.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/Quick%20Action/enhanced_actions_grid.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/Themes/admin_home_theme_helper.dart';
import 'package:uccd/Features/Profile/Presentation/Views/add_student_view.dart';
import 'package:uccd/generated/l10n.dart';
import 'package:uccd/main.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AdminHomeThemeHelper.spacingMedium,
        vertical: AdminHomeThemeHelper.spacingLarge,
      ),
      decoration:
          AdminHomeThemeHelper.getEnhancedQuickActionsDecoration(context),
      child: Padding(
        padding: const EdgeInsets.all(AdminHomeThemeHelper.spacingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                FittedBox(
                  fit: BoxFit.contain,
                  child: Icon(
                    Icons.flash_on,
                    color: AdminHomeThemeHelper.getActionCardIconColor(context),
                  ),
                ),
                const SizedBox(width: AdminHomeThemeHelper.spacingSmall),
                Expanded(
                  child: SectionTitle(
                    title: S.of(context).quickActions,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(26), // 10% opacity
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${actions(context).length} ${S.of(context).actions}',
                    style: AppText.style12Regular(context).copyWith(
                      color: Colors.white.withAlpha(204), // 80% opacity
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AdminHomeThemeHelper.spacingMedium,
            ),
            EnhancedActionsGrid(
              actions: actions(context),
            ),
          ],
        ),
      ),
    );
  }

  List<Map<String, dynamic>> actions(BuildContext context) {
    List<Map<String, dynamic>> actions = [
      {
        'icon': Icons.add_circle_outline,
        'title': S.of(context).addCourse,
        'subtitle': S.of(context).createNewCourse,
        'gradient': AdminHomeThemeHelper.getQuickActionPrimaryGradient(context),
        'onTap': () {
          context.push(AddCourseView.id);
        }
      },
      {
        'icon': Icons.category_outlined,
        'title': S.of(context).addCategory,
        'subtitle': S.of(context).manageCategories,
        'gradient':
            AdminHomeThemeHelper.getQuickActionTertiaryGradient(context),
        'onTap': () {
          OverlayController.showAddCategoryDialog(context);
        }
      },
      {
        'icon': Icons.post_add,
        'title': S.of(context).addPost,
        'subtitle': S.of(context).communityPost,
        'gradient':
            AdminHomeThemeHelper.getQuickActionQuaternaryGradient(context),
        'onTap': () {
          OverlayController.showCreatePostDialog(context);
        }
      },
      {
        'icon': Icons.person_add_outlined,
        'title': S.of(context).addInstructor,
        'subtitle': S.of(context).newInstructor,
        'gradient':
            AdminHomeThemeHelper.getQuickActionSecondaryGradient(context),
        'onTap': () {
          OverlayController.showAddInstructorDialog(context);
        }
      },
      {
        'icon': Icons.school_outlined,
        'title': S.of(context).addStudent,
        'subtitle': S.of(context).registerStudent,
        'gradient': AdminHomeThemeHelper.getQuickActionWarningGradient(context),
        'onTap': () {
          context.push(AddStudentView.id);
        }
      },
    ];

    return isSuperAdmin() ? actions : actions.sublist(0, 3);
  }

  bool isSuperAdmin() {
    return InternalStorage.getString('role') == 'SuperAdmin';
  }
}
