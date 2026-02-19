import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';

class AdaptiveBottomNavBar extends StatelessWidget {
  const AdaptiveBottomNavBar({
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
    final unselectedItemColor = isDarkMode ? Colors.white70 : Colors.black54;

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
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: onTap,
        selectedItemColor: AppColor.primary,
        unselectedItemColor: unselectedItemColor,
        selectedLabelStyle: AppText.style12Bold(context),
        unselectedLabelStyle: AppText.style12Regular(context),
        items: [
          _buildBottomNavItem(context, 'Home', FontAwesomeIcons.house, 0),
          _buildBottomNavItem(context, 'Courses', FontAwesomeIcons.bookOpen, 1),
          _buildBottomNavItem(context, 'Community', FontAwesomeIcons.globe, 2),
          _buildBottomNavItem(
              context, 'Profile', FontAwesomeIcons.solidUser, 3),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavItem(
      BuildContext context, String title, IconData icon, int index) {
    final isSelected = currentIndex == index;

    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 4, top: 8),
        child: Icon(
          icon,
          size: 20,
          color: isSelected
              ? AppColor.primary
              : Theme.of(context).brightness == Brightness.dark
                  ? Colors.white70
                  : Colors.black54,
        ),
      ),
      label: title,
    );
  }
}
