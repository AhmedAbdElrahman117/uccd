import 'package:flutter/material.dart';

/// Enhanced overlay background with modern design, blur effects, and animations
class EnhancedOverlayBackground extends StatefulWidget {
  const EnhancedOverlayBackground({
    super.key,
    required this.child,
    this.showBlur = true,
    this.borderRadius = 20.0,
    this.padding = const EdgeInsets.all(16),
    this.margin = const EdgeInsets.symmetric(horizontal: 28),
    this.backgroundColor,
    this.shadowColor,
    this.elevation = 12.0,
  });

  final Widget child;
  final bool showBlur;
  final double borderRadius;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color? backgroundColor;
  final Color? shadowColor;
  final double elevation;

  @override
  State<EnhancedOverlayBackground> createState() =>
      _EnhancedOverlayBackgroundState();
}

class _EnhancedOverlayBackgroundState extends State<EnhancedOverlayBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    ));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = widget.backgroundColor ??
        (Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[900]?.withValues(alpha: 0.95)
            : Colors.white.withValues(alpha: 0.95)) ??
        Colors.white;

    final shadowColor = widget.shadowColor ??
        (Theme.of(context).brightness == Brightness.dark
            ? Colors.black.withValues(alpha: 0.5)
            : Colors.grey.withValues(alpha: 0.3));

    return Padding(
      padding: widget.margin,
      child: Align(
        alignment: Alignment.center,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Opacity(
                opacity: _opacityAnimation.value,
                child: Container(
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    boxShadow: [
                      BoxShadow(
                        color: shadowColor,
                        blurRadius: widget.elevation,
                        offset: const Offset(0, 8),
                        spreadRadius: 2,
                      ),
                      BoxShadow(
                        color: shadowColor.withValues(alpha: 0.1),
                        blurRadius: widget.elevation * 2,
                        offset: const Offset(0, 16),
                        spreadRadius: 4,
                      ),
                    ],
                    border: Border.all(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey[800] ?? Colors.grey
                          : Colors.grey[200] ?? Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    child: BackdropFilter(
                      filter: widget.showBlur
                          ? const ColorFilter.matrix([
                              1,
                              0,
                              0,
                              0,
                              0,
                              0,
                              1,
                              0,
                              0,
                              0,
                              0,
                              0,
                              1,
                              0,
                              0,
                              0,
                              0,
                              0,
                              1,
                              0,
                            ])
                          : const ColorFilter.matrix([
                              1,
                              0,
                              0,
                              0,
                              0,
                              0,
                              1,
                              0,
                              0,
                              0,
                              0,
                              0,
                              1,
                              0,
                              0,
                              0,
                              0,
                              0,
                              1,
                              0,
                            ]),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              backgroundColor.withValues(alpha: 0.1),
                              backgroundColor.withValues(alpha: 0.05),
                              Colors.transparent,
                            ],
                            stops: const [0.0, 0.5, 1.0],
                          ),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: Padding(
                            padding: widget.padding,
                            child: widget.child,
                          ),
                        ),
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
