import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Themes/admin_courses_theme_helper.dart';
import 'package:uccd/generated/l10n.dart';

class EnhancedAdminCoursesTabBar extends StatefulWidget
    implements PreferredSizeWidget {
  const EnhancedAdminCoursesTabBar({
    super.key,
    required this.tabController,
    required this.currentIndex,
  });

  final TabController tabController;
  final int currentIndex;

  @override
  State<EnhancedAdminCoursesTabBar> createState() =>
      _EnhancedAdminCoursesTabBarState();

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

class _EnhancedAdminCoursesTabBarState extends State<EnhancedAdminCoursesTabBar>
    with TickerProviderStateMixin {
  late AnimationController _slideController;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _slideController = AnimationController(
      duration: AdminCoursesThemeHelper.animationDuration,
      vsync: this,
    );

    _slideAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: AdminCoursesThemeHelper.animationCurve,
    ));

    _slideController.forward();
  }

  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> tabs = [
      S.of(context).availableCourses,
      S.of(context).archivedCourses,
    ];
    return PreferredSize(
      preferredSize: widget.preferredSize,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -1),
          end: Offset.zero,
        ).animate(_slideAnimation),
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: AdminCoursesThemeHelper.spacingMedium,
            vertical: AdminCoursesThemeHelper.spacingSmall,
          ),
          decoration:
              AdminCoursesThemeHelper.getEnhancedTabBarDecoration(context),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: TabBar(
              controller: widget.tabController,
              onTap: _handleTabTap,
              tabs: tabs
                  .map(
                    (tab) => _buildTab(context, tab),
                  )
                  .toList(),
              indicator: _buildTabIndicator(context),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: const EdgeInsets.symmetric(
                horizontal: AdminCoursesThemeHelper.spacingSmall,
                vertical: AdminCoursesThemeHelper.spacingSmall,
              ),
              labelColor: Colors.white,
              unselectedLabelColor:
                  AdminCoursesThemeHelper.getInactiveTabLabelColor(context),
              labelStyle: AppText.style16Regular(context).copyWith(
                letterSpacing: 0.3,
              ),
              unselectedLabelStyle: AppText.style16Regular(context).copyWith(
                letterSpacing: 0.3,
              ),
              dividerColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              overlayColor: WidgetStateProperty.all(Colors.transparent),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTab(BuildContext context, String text) {
    return AnimatedContainer(
      duration: AdminCoursesThemeHelper.fastAnimationDuration,
      padding: const EdgeInsets.symmetric(
        vertical: AdminCoursesThemeHelper.spacingMedium,
        horizontal: AdminCoursesThemeHelper.spacingSmall,
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Decoration _buildTabIndicator(BuildContext context) {
    return AdminCoursesThemeHelper.getTabIndicatorDecoration(context);
  }

  void _handleTabTap(int index) {
    // Haptic feedback
    HapticFeedback.selectionClick();

    // Additional tab-specific actions can be added here
  }
}
