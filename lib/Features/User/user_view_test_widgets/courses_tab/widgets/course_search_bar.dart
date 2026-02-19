import 'package:flutter/material.dart';
import 'package:uccd/Features/User/Home/Presentation/Views%20Model/User%20Home%20Cubit/user_home_cubit.dart';
import 'package:uccd/generated/l10n.dart';

class CourseSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final UserHomeCubit cubit;
  final bool isDarkMode;
  final Color textColor;

  const CourseSearchBar({
    super.key,
    required this.controller,
    required this.cubit,
    required this.isDarkMode,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: TextField(
        controller: controller,
        style: TextStyle(color: textColor),
        decoration: InputDecoration(
          hintText: S.of(context).searchCourses,
          hintStyle: TextStyle(
            color: textColor.withValues(
              alpha: 0.5,
            ),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: textColor.withValues(
              alpha: 0.7,
            ),
          ),
          filled: true,
          fillColor:
              isDarkMode ? const Color(0xFF333333) : Colors.grey.shade100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
        ),
        onChanged: (value) {
          cubit.search(value);
        },
      ),
    );
  }
}
