import 'package:flutter/material.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/AppBar/user_logo.dart';
import 'package:uccd/main.dart';
import 'package:uccd/generated/l10n.dart';

class ProfileData extends StatelessWidget {
  const ProfileData({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : Colors.black87;
    final subtitleColor = isDarkMode ? Colors.white70 : Colors.black54;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDarkMode
              ? [
                  const Color(0xFF2A2A2A),
                  const Color(0xFF1A1A1A),
                ]
              : [
                  const Color(0xFFF7B626).withValues(alpha: 0.1),
                  const Color(0xFFFFFFFF),
                ],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
        child: Column(
          children: [
            // Avatar with enhanced styling
            const UserLogo(
              radius: 50,
              backgroundColor: AppColor.primary,
            ),

            const SizedBox(height: 20),

            // User Information Card
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 20,
              ),
              decoration: BoxDecoration(
                color: isDarkMode
                    ? Colors.white.withValues(alpha: 0.05)
                    : Colors.white.withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.2),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                spacing: 4,
                children: [
                  // Name
                  Text(
                    InternalStorage.getString('name'),
                    style: AppText.style20Bold(context).copyWith(
                      color: textColor,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 8),

                  // Email
                  Text(
                    InternalStorage.getString('email'),
                    style: AppText.style14Regular(context).copyWith(
                      color: subtitleColor,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 12), // Role Badge
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: _getRoleColor().withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: _getRoleColor().withValues(alpha: 0.3),
                      ),
                    ),
                    child: Text(
                      _getLocalizedRole(context),
                      style: AppText.style14Bold(context).copyWith(
                        color: _getRoleColor(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getLocalizedRole(BuildContext context) {
    final role = InternalStorage.getString('role');
    switch (role.toLowerCase()) {
      case 'superadmin':
        return S.of(context).roleSuperAdmin;
      case 'admin':
        return S.of(context).roleAdmin;
      case 'instructor':
        return S.of(context).roleInstructor;
      case 'student':
        return S.of(context).roleStudent;
      default:
        return role; // Fallback to original role if not found
    }
  }

  Color _getRoleColor() {
    final role = InternalStorage.getString('role');
    switch (role.toLowerCase()) {
      case 'superadmin':
        return const Color(0xFFE91E63); // Pink for SuperAdmin
      case 'admin':
        return const Color(0xFF2196F3); // Blue for Admin
      case 'instructor':
        return const Color(0xFF4CAF50); // Green for Instructor
      case 'student':
        return const Color(0xFFFF9800); // Orange for Student
      default:
        return const Color(0xFF9E9E9E); // Gray for others
    }
  }
}
