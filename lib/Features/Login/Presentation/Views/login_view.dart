import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Components/custom_loading_indicator.dart';
import 'package:uccd/Core/app_banners.dart';
import 'package:uccd/Core/app_exception.dart';
import 'package:uccd/Features/Admin/admin_view.dart';
import 'package:uccd/Features/Instructor/Presentation/instructor_view.dart';
import 'package:uccd/Features/Login/Presentation/Views%20Model/Login%20Cubit/login_cubit.dart';
import 'package:uccd/Features/Login/Presentation/Views%20Model/Login%20Cubit/login_states.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/login_fields_box.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/login_theme_button.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/logo.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/welcome_text.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/login_theme_helper.dart';
import 'package:uccd/Features/Login/Presentation/Views/otp_verification_view.dart';
import 'package:uccd/Features/Login/Presentation/Views/registeration_form_view.dart';
import 'package:uccd/Features/Super%20Admin/Presentation/View/super_admin_view.dart';
import 'package:uccd/Features/User/user_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  static const String id = '/Login';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with TickerProviderStateMixin {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController =
      TextEditingController(text: 'ahmed1@btu.edu.eg');
  TextEditingController passwordController =
      TextEditingController(text: '123456789');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocListener<LoginCubit, LoginStates>(
        listener: _listener,
        child: Stack(
          children: [
            Scaffold(
              body: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      LoginThemeHelper.getBackgroundGradientStart(context),
                      LoginThemeHelper.getBackgroundGradientMiddle(context),
                      LoginThemeHelper.getBackgroundGradientEnd(context),
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  ),
                ),
                child: SafeArea(
                  child: Form(
                    key: formKey,
                    child: Center(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          const LoginThemeButton(),
                          const SizedBox(height: 20),
                          const Logo(),
                          const SizedBox(height: 20),
                          const WelcomeText(),
                          LoginFieldsBox(
                            emailController: emailController,
                            passwordController: passwordController,
                            formKey: formKey,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            BlocSelector<LoginCubit, LoginStates, bool>(
              selector: (state) {
                if (state is LoginLoading) {
                  return true;
                }
                return false;
              },
              builder: (context, state) {
                return CustomLoadingIndicator(
                  isLoading: state,
                  child: const SizedBox(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _listener(BuildContext context, LoginStates state) {
    if (state is LoginFailed) {
      AppBanners.showFailed(
        message: AppException.getLocalizedMessage(state.errorMessage, context),
      );
    } else if (state is StudentRole) {
      state.user.isFirstRegister!
          ? context.push(
              RegisterationFormView.id,
              extra: state.user,
            )
          : context.go(UserView.id);
    } else if (state is SuperAdminRole) {
      if (kReleaseMode) {
        context.push(
          OtpVerificationView.id,
          extra: emailController.text,
        );
      } else {
        context.go(
          SuperAdminView.id,
        );
      }
    } else if (state is AdminRole) {
      if (kReleaseMode) {
        context.push(
          OtpVerificationView.id,
          extra: emailController.text,
        );
      } else {
        context.go(
          AdminView.id,
        );
      }
    } else if (state is InstructorRole) {
      context.go(InstructorView.id);
    }
  }
}
