import 'package:flutter/material.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Categories/category_theme_helper.dart';
import 'package:uccd/generated/l10n.dart';

class CategoryViewFab extends StatefulWidget {
  const CategoryViewFab({super.key});

  @override
  State<CategoryViewFab> createState() => _CategoryViewFabState();
}

class _CategoryViewFabState extends State<CategoryViewFab>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: CategoryThemeHelper.fabAnimationDuration,
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: CategoryThemeHelper.fabAnimationCurve,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              boxShadow: CategoryThemeHelper.getFabShadow(context),
            ),
            child: FloatingActionButton.extended(
              onPressed: () {
                _animationController.forward().then((_) {
                  _animationController.reverse();
                });
                OverlayController.showAddCategoryDialog(context);
              },
              backgroundColor:
                  CategoryThemeHelper.getCategoryIconColor(context),
              foregroundColor: Colors.white,
              elevation: 0,
              highlightElevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
              icon: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(51),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.add_rounded,
                  size: 20,
                ),
              ),
              label: Text(
                S.of(context).addCategory,
                style: CategoryThemeHelper.getActionButtonTextStyle(context)
                    .copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
