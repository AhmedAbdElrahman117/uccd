import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Components/custom_loading_indicator.dart';
import 'package:uccd/Core/app_banners.dart';
import 'package:uccd/Features/Admin/admin_view.dart';
import 'package:uccd/Features/Instructor/instructor_view.dart';
import 'package:uccd/Features/Login/Presentation/Views%20Model/Login%20Cubit/login_cubit.dart';
import 'package:uccd/Features/Login/Presentation/Views%20Model/Login%20Cubit/login_states.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/login_email_field.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/login_button.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/logo.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/login_password_field.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/welcome_text.dart';
import 'package:uccd/Features/Login/Presentation/Views/registeration_form_view.dart';
import 'package:uccd/Features/User/user_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  static const String id = '/Login';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController(
    text: 'ahmed1@btu.edu.eg',
  );
  TextEditingController passwordController = TextEditingController(
    text: '123456789',
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocListener<LoginCubit, LoginStates>(
        listener: _listener,
        child: Stack(
          children: [
            Scaffold(
              body: SafeArea(
                child: Form(
                  key: formKey,
                  child: Center(
                    child: ListView(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      physics: const ClampingScrollPhysics(),
                      children: [
                        const Logo(),
                        const WelcomeText(),
                        LoginEmailField(emailController: emailController),
                        LoginPasswordField(
                          passwordController: passwordController,
                        ),
                        LoginButton(
                          formKey: formKey,
                          emailController: emailController,
                          passwordController: passwordController,
                        ),
                      ],
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
      AppBanners.showFailed(message: state.errorMessage);
    } else if (state is StudentRole) {
      state.user.isFirstRegister!
          ? context.push(RegisterationFormView.id, extra: state.user)
          : context.go(UserView.id);
    } else if (state is AdminRole) {
      // context.push(
      //   OtpVerificationView.id,
      //   extra: emailController.text,
      // );

      context.go(AdminView.id);
    } else if (state is InstructorRole) {
      context.go(InstructorView.id);
    }
  }
}
