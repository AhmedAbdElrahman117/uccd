import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';

class AdaptiveTabBar extends StatelessWidget {
  const AdaptiveTabBar({
    super.key,
    required this.tabController,
    required this.onTap,
    required this.currentIndex,
  });

  final TabController tabController;
  final Function(int) onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? const Color(0xFF252525) : Colors.white;
    final borderColor =
        isDarkMode ? const Color(0xFF3D3D3D) : const Color(0xFFEAEAEA);

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: isDarkMode
                ? Colors.black12
                : Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
        border: Border(
          top: BorderSide(
            color: borderColor,
            width: 1,
          ),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: TabBar(
          controller: tabController,
          onTap: onTap,
          dividerColor: Colors.transparent,
          indicatorColor: AppColor.primary,
          labelColor: AppColor.primary,
          unselectedLabelColor: isDarkMode ? Colors.white70 : Colors.black54,
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: AppText.style12Bold(context),
          labelPadding: const EdgeInsets.symmetric(vertical: 10),
          tabs: [
            _buildTab(context, 'Home', FontAwesomeIcons.house, 0),
            _buildTab(context, 'Courses', FontAwesomeIcons.bookOpen, 1),
            _buildTab(context, 'Community', FontAwesomeIcons.globe, 2),
            _buildTab(context, 'Profile', FontAwesomeIcons.solidUser, 3),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(
      BuildContext context, String title, IconData icon, int index) {
    final isSelected = currentIndex == index;
    return Tab(
      text: title,
      icon: Icon(
        icon,
        size: 20,
        color:
            isSelected ? AppColor.primary : Theme.of(context).iconTheme.color,
      ),
      iconMargin: const EdgeInsets.only(bottom: 4),
    );
  }
}
