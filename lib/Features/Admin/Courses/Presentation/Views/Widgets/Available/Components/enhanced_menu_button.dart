import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/Themes/admin_menu_theme_helper.dart';

/// Enhanced menu button with modern design, animations, and accessibility features
class EnhancedMenuButton extends StatefulWidget {
  const EnhancedMenuButton({
    super.key,
    required this.title,
    required this.icon,
    required this.type,
    required this.courseId,
    this.subtitle,
    this.tooltip,
    this.semanticLabel,
    this.shortcutKey,
    this.onTap,
    this.isEnabled = true,
    this.showBadge = false,
    this.badgeCount,
  });

  final String title;
  final IconData icon;
  final AdminMenuButtonType type;
  final String? courseId;
  final String? subtitle;
  final String? tooltip;
  final String? semanticLabel;
  final String? shortcutKey;
  final VoidCallback? onTap;
  final bool isEnabled;
  final bool showBadge;
  final int? badgeCount;

  @override
  State<EnhancedMenuButton> createState() => _EnhancedMenuButtonState();
}

class _EnhancedMenuButtonState extends State<EnhancedMenuButton>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  final bool _isHovered = false;
  final bool _isPressed = false;
  bool _isFocused = false;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: AdminMenuThemeHelper.animationDuration,
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.04,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTap() {
    if (widget.isEnabled && widget.onTap != null) {
      HapticFeedback.mediumImpact();
      widget.onTap!();
    }
  }

  void _handleFocusChange(bool isFocused) {
    setState(() {
      _isFocused = isFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    // Enhanced responsive breakpoints
    final isSmallMobile = screenWidth < 360;
    final isMobile = screenWidth <= 600;
    final isTablet = screenWidth > 600 && screenWidth <= 1024;

    // Responsive dimensions with better mobile optimization
    double buttonWidth;
    double buttonHeight;
    double iconSize;
    double iconBackgroundSize;
    double subtitleFontSize;
    double padding;
    double borderRadius;
    double spacing;
    int maxLines;

    if (isSmallMobile) {
      buttonWidth = screenWidth * 0.42;
      buttonHeight = screenHeight * 0.14;
      iconSize = 20.0;
      iconBackgroundSize = 40.0;
      subtitleFontSize = 9.0;
      padding = 8.0;
      borderRadius = 12.0;
      spacing = 6.0;
      maxLines = 1;
    } else if (isMobile) {
      buttonWidth = screenWidth * 0.4;
      buttonHeight = screenHeight * 0.16;
      iconSize = 24.0;
      iconBackgroundSize = 48.0;
      subtitleFontSize = 10.0;
      padding = 12.0;
      borderRadius = 16.0;
      spacing = 8.0;
      maxLines = 2;
    } else if (isTablet) {
      buttonWidth = 160.0;
      buttonHeight = 180.0;
      iconSize = 32.0;
      iconBackgroundSize = 64.0;
      subtitleFontSize = 12.0;
      padding = 20.0;
      borderRadius = 24.0;
      spacing = 12.0;
      maxLines = 2;
    } else {
      buttonWidth = 140.0;
      buttonHeight = 160.0;
      iconSize = 28.0;
      iconBackgroundSize = 56.0;
      subtitleFontSize = 11.0;
      padding = 16.0;
      borderRadius = 20.0;
      spacing = 10.0;
      maxLines = 2;
    }

    return Tooltip(
      message: widget.tooltip ?? widget.title,
      child: Focus(
        onFocusChange: _handleFocusChange,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return GestureDetector(
              onTap: _handleTap,
              child: Transform.scale(
                scale: _isPressed ? 0.95 : _scaleAnimation.value,
                child: AnimatedContainer(
                  duration: AdminMenuThemeHelper.hoverDuration,
                  curve: Curves.easeOutCubic,
                  width: buttonWidth,
                  height: buttonHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    color: (_isHovered || _isFocused)
                        ? AdminMenuThemeHelper.getPrimaryColor(
                                context, widget.type)
                            .withValues(alpha: 0.15)
                        : AdminMenuThemeHelper.getPrimaryColor(
                                context, widget.type)
                            .withValues(alpha: 0.08),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                    border: Border.all(
                      color: (_isHovered || _isFocused)
                          ? AdminMenuThemeHelper.getPrimaryColor(
                                  context, widget.type)
                              .withValues(alpha: 0.3)
                          : Colors.transparent,
                      width: 1.0,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(borderRadius),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Animated background overlay
                        AnimatedContainer(
                          duration: AdminMenuThemeHelper.hoverDuration,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white.withValues(
                                    alpha:
                                        (_isHovered || _isFocused) ? 0.2 : 0.1),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),

                        // Main content
                        Padding(
                          padding: EdgeInsets.all(padding),
                          child: Column(
                            spacing: 4,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Icon section with enhanced styling
                              Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.center,
                                children: [
                                  // Icon background with pulse effect
                                  AnimatedContainer(
                                    duration:
                                        AdminMenuThemeHelper.hoverDuration,
                                    width: iconBackgroundSize,
                                    height: iconBackgroundSize,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: (_isHovered || _isFocused)
                                          ? Colors.white.withValues(alpha: 0.9)
                                          : Colors.white.withValues(alpha: 0.7),
                                      boxShadow: [
                                        BoxShadow(
                                          color: AdminMenuThemeHelper
                                                  .getPrimaryColor(
                                                      context, widget.type)
                                              .withValues(alpha: 0.3),
                                          blurRadius: (_isHovered || _isFocused)
                                              ? (isMobile ? 8 : 12)
                                              : (isMobile ? 3 : 6),
                                          spreadRadius:
                                              (_isHovered || _isFocused)
                                                  ? (isMobile ? 1 : 2)
                                                  : 0,
                                        ),
                                      ],
                                    ),
                                    child: Icon(
                                      widget.icon,
                                      size: iconSize,
                                      color:
                                          AdminMenuThemeHelper.getPrimaryColor(
                                              context, widget.type),
                                    ),
                                  ),

                                  // Enhanced badge with glow effect
                                  if (widget.showBadge &&
                                      widget.badgeCount != null)
                                    Positioned(
                                      right: isMobile ? -2 : -4,
                                      top: isMobile ? -2 : -4,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: isMobile ? 4 : 6,
                                          vertical: isMobile ? 1 : 2,
                                        ),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.red.shade400,
                                              Colors.red.shade600,
                                            ],
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              isMobile ? 8 : 12),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.red
                                                  .withValues(alpha: 0.5),
                                              blurRadius: isMobile ? 4 : 8,
                                              spreadRadius: isMobile ? 0.5 : 1,
                                            ),
                                          ],
                                        ),
                                        constraints: BoxConstraints(
                                          minWidth: isMobile ? 16 : 20,
                                          minHeight: isMobile ? 16 : 20,
                                        ),
                                        child: Text(
                                          widget.badgeCount!.toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: isMobile ? 9 : 11,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                ],
                              ),

                              SizedBox(height: spacing),

                              // Title with enhanced styling
                              Flexible(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    widget.title,
                                    style:
                                        AppText.style14Bold(context).copyWith(
                                      color: (_isHovered || _isFocused)
                                          ? Colors.white
                                          : AdminMenuThemeHelper
                                              .getPrimaryColor(
                                                  context, widget.type),
                                      letterSpacing: isMobile ? 0.3 : 0.5,
                                      height: isMobile ? 1.1 : 1.2,
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: maxLines,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),

                              // Subtitle if provided and screen is large enough
                              if (widget.subtitle != null &&
                                  !isSmallMobile) ...[
                                SizedBox(height: spacing / 2),
                                Text(
                                  widget.subtitle!,
                                  style: TextStyle(
                                    fontSize: subtitleFontSize,
                                    color: (_isHovered || _isFocused)
                                        ? Colors.white.withValues(alpha: 0.9)
                                        : AdminMenuThemeHelper.getPrimaryColor(
                                                context, widget.type)
                                            .withValues(alpha: 0.7),
                                    height: 1.1,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ],
                          ),
                        ),

                        // Ripple effect overlay
                        if (_isPressed)
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(borderRadius),
                                color: Colors.white.withValues(alpha: 0.3),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
