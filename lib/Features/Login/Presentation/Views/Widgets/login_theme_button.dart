import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uccd/Core/utils_provider.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/login_theme_helper.dart';

class LoginThemeButton extends StatefulWidget {
  const LoginThemeButton({
    super.key,
  });

  @override
  State<LoginThemeButton> createState() => _LoginThemeButtonState();
}

class _LoginThemeButtonState extends State<LoginThemeButton>
    with TickerProviderStateMixin {
  late AnimationController _themeToggleController;
  late Animation<double> _themeToggleAnimation;

  @override
  void initState() {
    super.initState();
    _themeToggleController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _themeToggleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _themeToggleController,
      curve: Curves.elasticOut,
    ));
  }

  @override
  void dispose() {
    _themeToggleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: AnimatedBuilder(
        animation: _themeToggleAnimation,
        builder: (context, child) {
          final flipAngle = _themeToggleAnimation.value * 3.14159;

          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // Add perspective
              ..rotateX(flipAngle), // Flip around Y axis
            child: Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: LoginThemeHelper.getCardColor(context),
                border: LoginThemeHelper.getCardBorder(context),
                boxShadow: [
                  BoxShadow(
                    color: LoginThemeHelper.isDark(context)
                        ? Colors.black.withValues(alpha: 0.3)
                        : Colors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () async {
                  // Start animation
                  _themeToggleController.forward().then((_) {
                    _themeToggleController.reset();
                  });

                  Provider.of<UtilsProvider>(context, listen: false)
                      .changeThemeMode();
                },
                icon: Icon(
                  LoginThemeHelper.isDark(context)
                      ? Icons.light_mode
                      : Icons.dark_mode,
                  color: LoginThemeHelper.isDark(context)
                      ? Colors.amber
                      : Colors.grey.shade700,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
