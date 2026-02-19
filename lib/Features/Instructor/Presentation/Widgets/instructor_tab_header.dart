import 'package:flutter/material.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Core/app_color.dart';

class InstructorTabHeader extends StatelessWidget {
  const InstructorTabHeader({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: const Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Instructor Dashboard',
            style: AppText.style24Bold(context),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: isDarkMode
                  ? const Color(0xFF2A2A2A)
                  : const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TabBar(
              controller: tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              labelColor: Colors.white,
              unselectedLabelColor:
                  isDarkMode ? Colors.white70 : Colors.black54,
              labelStyle: AppText.style14Bold(context),
              unselectedLabelStyle: AppText.style14Regular(context),
              tabs: const [
                Tab(
                  icon: Icon(Icons.dashboard_outlined, size: 20),
                  text: 'Dashboard',
                ),
                Tab(
                  icon: Icon(Icons.school_outlined, size: 20),
                  text: 'My Courses',
                ),
                Tab(
                  icon: Icon(Icons.people_outline, size: 20),
                  text: 'Students',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
