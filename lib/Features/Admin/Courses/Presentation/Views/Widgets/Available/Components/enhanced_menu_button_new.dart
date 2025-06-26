import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  late AnimationController _pulseController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;
  late Animation<double> _pulseAnimation;

  bool _isHovered = false;
  bool _isPressed = false;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: AdminMenuThemeHelper.animationDuration,
      vsync: this,
    );

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.08,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    ));

    _elevationAnimation = Tween<double>(
      begin: 2.0,
      end: 12.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
    ));

    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.15,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));

    // Start subtle pulse animation
    _pulseController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  void _handleTap() {
    if (widget.isEnabled && widget.onTap != null) {
      HapticFeedback.mediumImpact();
      // Create a ripple effect
      _pulseController.reset();
      _pulseController.forward();
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
    double fontSize;
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
      fontSize = 11.0;
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
      fontSize = 12.0;
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
      fontSize = 16.0;
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
      fontSize = 14.0;
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
          animation: Listenable.merge([_animationController, _pulseController]),
          builder: (context, child) {
            return MouseRegion(
              onEnter: (_) {
                setState(() {
                  _isHovered = true;
                });
                _animationController.forward();
              },
              onExit: (_) {
                setState(() {
                  _isHovered = false;
                });
                _animationController.reverse();
              },
              child: GestureDetector(
                onTap: _handleTap,
                onTapDown: (_) {
                  setState(() {
                    _isPressed = true;
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    _isPressed = false;
                  });
                },
                onTapCancel: () {
                  setState(() {
                    _isPressed = false;
                  });
                },
                child: Transform.scale(
                  scale: _isPressed ? 0.95 : _scaleAnimation.value,
                  child: AnimatedContainer(
                    duration: AdminMenuThemeHelper.hoverDuration,
                    curve: Curves.easeOutCubic,
                    width: buttonWidth,
                    height: buttonHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(borderRadius),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          _isPressed
                              ? AdminMenuThemeHelper.getPressedColor(
                                  context, widget.type)
                              : (_isHovered || _isFocused)
                                  ? AdminMenuThemeHelper.getHoverColor(
                                      context, widget.type)
                                  : AdminMenuThemeHelper.getSecondaryColor(
                                      context, widget.type),
                          _isPressed
                              ? AdminMenuThemeHelper.getPressedColor(
                                  context, widget.type)
                              : (_isHovered || _isFocused)
                                  ? AdminMenuThemeHelper.getPrimaryColor(
                                      context, widget.type)
                                  : AdminMenuThemeHelper.getHoverColor(
                                      context, widget.type),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AdminMenuThemeHelper.getShadowColor(
                              context, widget.type),
                          blurRadius: _elevationAnimation.value,
                          offset: Offset(0, _elevationAnimation.value / 2),
                          spreadRadius: (_isHovered || _isFocused) ? 2 : 0,
                        ),
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: isMobile ? 4 : 8,
                          offset: Offset(0, isMobile ? 2 : 4),
                        ),
                      ],
                      border: Border.all(
                        color: (_isHovered || _isFocused)
                            ? AdminMenuThemeHelper.getPrimaryColor(
                                context, widget.type)
                            : Colors.transparent,
                        width: isMobile ? 1.0 : 1.5,
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
                                  (_isHovered || _isFocused)
                                      ? Colors.white.withValues(alpha: 0.2)
                                      : Colors.white.withValues(alpha: 0.1),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),

                          // Main content
                          Padding(
                            padding: EdgeInsets.all(padding),
                            child: Column(
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
                                        color: AdminMenuThemeHelper
                                            .getIconBackgroundColor(
                                                context, widget.type,
                                                isHovered:
                                                    _isHovered || _isFocused),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AdminMenuThemeHelper
                                                .getShadowColor(
                                                    context, widget.type),
                                            blurRadius:
                                                (_isHovered || _isFocused)
                                                    ? (isMobile ? 8 : 12)
                                                    : (isMobile ? 3 : 6),
                                            spreadRadius:
                                                (_isHovered || _isFocused)
                                                    ? (isMobile ? 1 : 2)
                                                    : 0,
                                          ),
                                        ],
                                      ),
                                      child: Transform.scale(
                                        scale: isMobile
                                            ? 1.0
                                            : _pulseAnimation.value,
                                        child: Icon(
                                          widget.icon,
                                          size: iconSize,
                                          color:
                                              AdminMenuThemeHelper.getIconColor(
                                                  context, widget.type,
                                                  isHovered:
                                                      _isHovered || _isFocused),
                                        ),
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
                                                color: Colors.red.shade300,
                                                blurRadius: isMobile ? 4 : 8,
                                                spreadRadius:
                                                    isMobile ? 0.5 : 1,
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
                                      style: TextStyle(
                                        fontSize: fontSize,
                                        fontWeight: FontWeight.w600,
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
                                          : const Color(0xFF64748B),
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
              ),
            );
          },
        ),
      ),
    );
  }
}
