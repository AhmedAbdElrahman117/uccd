import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Models/user_model.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/Features/Admin/admin_view.dart';
import 'package:uccd/Features/Instructor/Presentation/instructor_view.dart';
import 'package:uccd/Features/Login/Presentation/Views/login_view.dart';
import 'package:uccd/Features/Splash/Presentation/Views/Widgets/floating_particles.dart';
import 'package:uccd/Features/Splash/Presentation/Views/Widgets/splash_background.dart';
import 'package:uccd/Features/Splash/Presentation/Views/Widgets/splash_loading.dart';
import 'package:uccd/Features/Splash/Presentation/Views/Widgets/splash_logo.dart';
import 'package:uccd/Features/Splash/Presentation/Views/Widgets/splash_text.dart';
import 'package:uccd/Features/Splash/Presentation/Views/Widgets/splash_theme_helper.dart';
import 'package:uccd/Features/Super%20Admin/Presentation/View/super_admin_view.dart';
import 'package:uccd/Features/User/user_view.dart';
import 'package:uccd/main.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const String id = '/';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _logoAnimationController;
  late AnimationController _textAnimationController;
  late AnimationController _backgroundAnimationController;
  late AnimationController _rotationController;

  late Animation<double> _logoScaleAnimation;
  late Animation<double> _logoFadeAnimation;
  late Animation<Offset> _logoSlideAnimation;
  late Animation<double> _textFadeAnimation;
  late Animation<Offset> _textSlideAnimation;
  late Animation<double> _backgroundAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _pulseAnimation;

  StreamSubscription? _userSubscription;

  bool _showContent = false;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startAnimationSequence();
  }

  @override
  void dispose() {
    _logoAnimationController.dispose();
    _textAnimationController.dispose();
    _backgroundAnimationController.dispose();
    _rotationController.dispose();
    _userSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: AnimatedBuilder(
        animation: _backgroundAnimation,
        builder: (context, child) {
          return SplashBackground(
            backgroundAnimation: _backgroundAnimation,
            child: Stack(
              children: [
                // Animated background particles
                ...List.generate(
                  SplashThemeHelper.particleCount,
                  (index) => FloatingParticles(
                    backgroundAnimation: _backgroundAnimation,
                    index: index,
                    rotationAnimation: _rotationAnimation,
                    screenSize: screenSize,
                  ),
                ),

                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: SplashThemeHelper.mainSpacing,
                    children: [
                      // Logo section
                      SplashLogo(
                        logoSlideAnimation: _logoSlideAnimation,
                        logoFadeAnimation: _logoFadeAnimation,
                        logoScaleAnimation: _logoScaleAnimation,
                        pulseAnimation: _pulseAnimation,
                      ),

                      // Text section
                      Hero(
                        tag: 'splash-text',
                        child: Material(
                          type: MaterialType.transparency,
                          child: SplashText(
                            textSlideAnimation: _textSlideAnimation,
                            textFadeAnimation: _textFadeAnimation,
                          ),
                        ),
                      ),

                      const SizedBox(
                          height: SplashThemeHelper.subtitleBottomSpacing),

                      // Loading indicator
                      SplashLoading(
                        showContent: _showContent,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _startAnimationSequence() async {
    // Start background animation
    _backgroundAnimationController.forward();

    // Start rotation animation (continuous)
    _rotationController.repeat();

    // Delay then start logo animation
    await Future.delayed(const Duration(milliseconds: 500));
    _logoAnimationController.forward();

    // Delay then start text animation
    await Future.delayed(const Duration(milliseconds: 1000));
    _textAnimationController.forward();

    // Show content after animations
    await Future.delayed(const Duration(milliseconds: 1500));
    setState(() {
      _showContent = true;
    });

    // Navigate to login after delay
    await Future.delayed(const Duration(milliseconds: 3000));
    if (mounted) {
      _userSubscription = FirebaseAuth.instance.userChanges().listen(
        (user) async {
          if (user != null) {
            await checkRole(
              FirebaseAuth.instance.currentUser!.uid,
            );
          } else {
            context.go(LoginView.id);
          }
        },
      );
    } else {
      _userSubscription?.cancel();
    }
  }

  checkRole(String userID) async {
    try {
      var user = await FirebaseFirestore.instance
          .collection('users')
          .doc(
            userID,
          )
          .withConverter(
            fromFirestore: (snapshot, options) => UserModel.fromJson(
              snapshot.data()!,
            ),
            toFirestore: (value, options) => value.toStudentMap(value.id!),
          )
          .get();

      if (user.data()?.role != null) {
        switch (user.data()!.role) {
          case 'SuperAdmin':
            save(user.data()!);
            context.go(SuperAdminView.id);
            break;
          case 'Admin':
            save(user.data()!);
            context.go(AdminView.id);
            break;
          case 'Instructor':
            save(user.data()!);
            context.go(InstructorView.id);
            break;
          case 'Student':
            save(user.data()!);
            context.go(UserView.id);
            break;
          default:
            context.go(LoginView.id);
        }
      }
    } catch (e) {
      OverlayController.showNoInternetDialog(context);
    }
  }

  void save(UserModel data) {
    InternalStorage.setString('id', data.id!);
    InternalStorage.setString('role', data.role);
    InternalStorage.setString('email', data.email);
    InternalStorage.setString('name', data.name);
    if (data.role == 'Student') {
      InternalStorage.setString('department', data.department!);
      InternalStorage.setString('year', data.year!);
    }
  }

  void _initializeAnimations() {
    // Logo animations
    _logoAnimationController = AnimationController(
      vsync: this,
      duration: SplashThemeHelper.logoAnimationDuration,
    );

    // Text animations
    _textAnimationController = AnimationController(
      vsync: this,
      duration: SplashThemeHelper.textAnimationDuration,
    );

    // Background animations
    _backgroundAnimationController = AnimationController(
      vsync: this,
      duration: SplashThemeHelper.backgroundAnimationDuration,
    );

    // Rotation animations
    _rotationController = AnimationController(
      vsync: this,
      duration: SplashThemeHelper.rotationAnimationDuration,
    );

    // Logo scale animation with bounce effect
    _logoScaleAnimation = Tween<double>(
      begin: SplashThemeHelper.logoScaleBegin,
      end: SplashThemeHelper.logoScaleEnd,
    ).animate(CurvedAnimation(
      parent: _logoAnimationController,
      curve: SplashThemeHelper.logoScaleCurve,
    ));

    // Logo fade animation
    _logoFadeAnimation = Tween<double>(
      begin: SplashThemeHelper.logoFadeBegin,
      end: SplashThemeHelper.logoFadeEnd,
    ).animate(CurvedAnimation(
      parent: _logoAnimationController,
      curve: SplashThemeHelper.logoFadeInterval,
    ));

    // Logo slide animation
    _logoSlideAnimation = Tween<Offset>(
      begin: SplashThemeHelper.logoSlideBegin,
      end: SplashThemeHelper.logoSlideEnd,
    ).animate(CurvedAnimation(
      parent: _logoAnimationController,
      curve: SplashThemeHelper.logoSlideCurve,
    ));

    // Text fade animation
    _textFadeAnimation = Tween<double>(
      begin: SplashThemeHelper.textFadeBegin,
      end: SplashThemeHelper.textFadeEnd,
    ).animate(CurvedAnimation(
      parent: _textAnimationController,
      curve: SplashThemeHelper.textFadeCurve,
    ));

    // Text slide animation
    _textSlideAnimation = Tween<Offset>(
      begin: SplashThemeHelper.textSlideBegin,
      end: SplashThemeHelper.textSlideEnd,
    ).animate(CurvedAnimation(
      parent: _textAnimationController,
      curve: SplashThemeHelper.textSlideCurve,
    ));

    // Background gradient animation
    _backgroundAnimation = Tween<double>(
      begin: SplashThemeHelper.backgroundBegin,
      end: SplashThemeHelper.backgroundEnd,
    ).animate(CurvedAnimation(
      parent: _backgroundAnimationController,
      curve: SplashThemeHelper.backgroundCurve,
    ));

    // Rotation animation
    _rotationAnimation = Tween<double>(
      begin: SplashThemeHelper.rotationBegin,
      end: SplashThemeHelper.rotationEnd,
    ).animate(CurvedAnimation(
      parent: _rotationController,
      curve: SplashThemeHelper.rotationCurve,
    ));

    // Pulse animation
    _pulseAnimation = Tween<double>(
      begin: SplashThemeHelper.pulseBegin,
      end: SplashThemeHelper.pulseEnd,
    ).animate(CurvedAnimation(
      parent: _logoAnimationController,
      curve: SplashThemeHelper.pulseCurve,
    ));
  }
}
