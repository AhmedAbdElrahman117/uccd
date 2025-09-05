import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/app_assets.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/Login/Presentation/Views/login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const String id = '/';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<Offset> slideAnimation;

  late Animation<double> fadeAnimation;

  bool exit = false;
  bool move = false;
  bool showText = false;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOutBack,
      ),
    );

    fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(animationController);

    animationController.forward();

    fadeAnimation.addListener(
      () {
        if (fadeAnimation.status.isCompleted) {
          Timer(
            const Duration(milliseconds: 400),
            () {
              exit = true;
              setState(() {});
            },
          );
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.lerp(
              Alignment.centerLeft,
              Alignment.center,
              1.4,
            )!,
            child: AnimatedOpacity(
              opacity: showText ? 1 : 0,
              onEnd: () {
                Timer(
                  const Duration(seconds: 1),
                  () {
                    context.go(LoginView.id);
                  },
                );
              },
              duration: const Duration(milliseconds: 400),
              child: Text(
                'UCCD',
                style: AppText.style28Bold(context).copyWith(
                  color: AppColor.primary,
                  fontSize: 32,
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 400),
            left: move ? 50 : 80,
            right: move ? MediaQuery.sizeOf(context).width * 0.55 : 50,
            top: 0,
            bottom: 0,
            onEnd: () {
              showText = true;
              setState(() {});
            },
            child: SlideTransition(
              position: slideAnimation,
              child: FadeTransition(
                opacity: fadeAnimation,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOutBack,
                  height: exit ? 40 : 120,
                  width: exit ? 40 : 120,
                  onEnd: () {
                    move = true;
                    setState(() {});
                  },
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(AppAssets.imagesUCCDGrouplogo2),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
