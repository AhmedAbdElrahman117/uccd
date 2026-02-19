import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/Models/post_model.dart';
import 'package:uccd/Core/Models/user_model.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/add_course_view.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/admin_archive_students_view.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/admin_course_ratings_view.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/interview_view.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/statistics_view.dart';
import 'package:uccd/Features/Community/Presentation/Views/comments_screen.dart';
import 'package:uccd/Features/Instructor/Presentation/instructor_view.dart';
import 'package:uccd/Features/Login/Presentation/Views%20Model/Register%20Form%20Cubit/register_form_cubit.dart';
import 'package:uccd/Features/Login/Presentation/Views/otp_verification_view.dart';
import 'package:uccd/Features/Login/Presentation/Views/register_confirmation_view.dart';
import 'package:uccd/Features/Login/Presentation/Views/registeration_form_view.dart';
import 'package:uccd/Features/Profile/Presentation/Views/admin_category_view.dart';
import 'package:uccd/Features/Profile/Presentation/Views/add_student_view.dart';
import 'package:uccd/Features/Admin/admin_view.dart';
import 'package:uccd/Features/Profile/Presentation/Views/admin_users_view.dart';
import 'package:uccd/Features/Profile/Presentation/Views/logs_view.dart';
import 'package:uccd/Features/Super%20Admin/Presentation/View/super_admin_view.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/course_details_view.dart';
import 'package:uccd/Features/User/user_view.dart';
import 'package:uccd/Features/Login/Presentation/Views/login_view.dart';

import '../Features/Splash/Presentation/Views/splash_view.dart';

class RouteNav {
  RouteNav._();

  static RouterConfig<Object>? router = GoRouter(
    routes: [
      GoRoute(
        path: SplashView.id,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const SplashView(),
            transitionDuration: const Duration(milliseconds: 400),
            reverseTransitionDuration: const Duration(milliseconds: 400),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: LoginView.id,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const LoginView(),
            transitionDuration: const Duration(milliseconds: 1200),
            reverseTransitionDuration: const Duration(milliseconds: 1200),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: OtpVerificationView.id,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: OtpVerificationView(
              email: state.extra as String,
            ),
            transitionDuration: const Duration(milliseconds: 400),
            reverseTransitionDuration: const Duration(milliseconds: 400),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: RegisterationFormView.id,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: RegisterationFormView(
              user: state.extra as UserModel,
            ),
            transitionDuration: const Duration(milliseconds: 400),
            reverseTransitionDuration: const Duration(milliseconds: 400),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: RegisterConfirmationView.id,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: RegisterConfirmationView(
              cubit: state.extra as RegisterFormCubit,
            ),
            transitionDuration: const Duration(milliseconds: 400),
            reverseTransitionDuration: const Duration(milliseconds: 400),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: UserView.id,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const UserView(),
            transitionDuration: const Duration(milliseconds: 400),
            reverseTransitionDuration: const Duration(milliseconds: 400),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: InstructorView.id,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const InstructorView(),
            transitionDuration: const Duration(milliseconds: 400),
            reverseTransitionDuration: const Duration(milliseconds: 400),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: AdminView.id,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const AdminView(),
            transitionDuration: const Duration(milliseconds: 1200),
            reverseTransitionDuration: const Duration(milliseconds: 1200),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: SuperAdminView.id,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const SuperAdminView(),
            transitionDuration: const Duration(milliseconds: 1200),
            reverseTransitionDuration: const Duration(milliseconds: 1200),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: CourseDetailsView.id,
        pageBuilder: (context, state) {
          Map<String, dynamic> map = state.extra as Map<String, dynamic>;
          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: const Duration(milliseconds: 600),
            reverseTransitionDuration: const Duration(milliseconds: 600),
            child: CourseDetailsView(
              tags: map['tags'] as Map<String, String>,
              course: map['data'] as CourseModel,
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: AddCourseView.id,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: AddCourseView(
              currentCourse: state.extra as CourseModel?,
            ),
            transitionDuration: const Duration(milliseconds: 600),
            reverseTransitionDuration: const Duration(milliseconds: 600),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: InterviewView.id,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: InterviewView(
              course: state.extra as CourseModel,
            ),
            transitionDuration: const Duration(milliseconds: 600),
            reverseTransitionDuration: const Duration(milliseconds: 600),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: CommentsScreen.id,
        pageBuilder: (context, state) {
          var post = state.extra as PostModel;
          return CustomTransitionPage(
            key: state.pageKey,
            child: CommentsScreen(
              postID: post.postID!,
            ),
            transitionDuration: const Duration(milliseconds: 600),
            reverseTransitionDuration: const Duration(milliseconds: 600),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      // GoRoute(
      //   path: AdminStudentsView.id,
      //   pageBuilder: (context, state) {
      //     return CustomTransitionPage(
      //       key: state.pageKey,
      //       child: const AdminStudentsView(),
      //       transitionDuration: const Duration(milliseconds: 600),
      //       reverseTransitionDuration: const Duration(milliseconds: 600),
      //       transitionsBuilder:
      //           (context, animation, secondaryAnimation, child) {
      //         return SlideTransition(
      //           position: Tween<Offset>(
      //             begin: const Offset(0, 1),
      //             end: Offset.zero,
      //           ).animate(animation),
      //           child: child,
      //         );
      //       },
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: AdminInstructorsView.id,
      //   pageBuilder: (context, state) {
      //     return CustomTransitionPage(
      //       key: state.pageKey,
      //       child: AdminInstructorsView(),
      //       transitionDuration: const Duration(milliseconds: 600),
      //       reverseTransitionDuration: const Duration(milliseconds: 600),
      //       transitionsBuilder:
      //           (context, animation, secondaryAnimation, child) {
      //         return SlideTransition(
      //           position: Tween<Offset>(
      //             begin: const Offset(0, 1),
      //             end: Offset.zero,
      //           ).animate(animation),
      //           child: child,
      //         );
      //       },
      //     );
      //   },
      // ),
      GoRoute(
        path: AdminCategoryView.id,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const AdminCategoryView(),
            transitionDuration: const Duration(milliseconds: 600),
            reverseTransitionDuration: const Duration(milliseconds: 600),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: StatisticsView.id,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: StatisticsView(
              course: state.extra as CourseModel,
            ),
            transitionDuration: const Duration(milliseconds: 600),
            reverseTransitionDuration: const Duration(milliseconds: 600),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: AddStudentView.id,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: AddStudentView(
              student: state.extra as UserModel?,
            ),
            transitionDuration: const Duration(milliseconds: 600),
            reverseTransitionDuration: const Duration(milliseconds: 600),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: AdminUsersView.id,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const AdminUsersView(),
            transitionDuration: const Duration(milliseconds: 600),
            reverseTransitionDuration: const Duration(milliseconds: 600),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: AdminArchiveStudentsView.id,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: AdminArchiveStudentsView(
              course: state.extra as CourseModel,
            ),
            transitionDuration: const Duration(milliseconds: 600),
            reverseTransitionDuration: const Duration(milliseconds: 600),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: AdminCourseRatingsView.id,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: AdminCourseRatingsView(
              course: state.extra as CourseModel,
            ),
            transitionDuration: const Duration(milliseconds: 600),
            reverseTransitionDuration: const Duration(milliseconds: 600),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: LogsView.id,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const LogsView(),
            transitionDuration: const Duration(milliseconds: 600),
            reverseTransitionDuration: const Duration(milliseconds: 600),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
    ],
  );

  static Widget builder(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    );
  }
}
