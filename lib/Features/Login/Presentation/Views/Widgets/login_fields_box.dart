import 'package:flutter/material.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/login_button.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/login_email_field.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/login_password_field.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/login_theme_helper.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/contact_support_button.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/o_r_divider.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/version_info.dart';

class LoginFieldsBox extends StatelessWidget {
  const LoginFieldsBox({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: LoginThemeHelper.getCardColor(context),
        borderRadius: BorderRadius.circular(24),
        border: LoginThemeHelper.getCardBorder(context),
        boxShadow: LoginThemeHelper.getCardShadows(context),
      ),
      child: Column(
        children: [
          LoginEmailField(
            emailController: emailController,
          ),
          const SizedBox(
            height: 24,
          ),
          LoginPasswordField(
            passwordController: passwordController,
          ),
          const SizedBox(
            height: 24,
          ),
          LoginButton(
            formKey: formKey,
            emailController: emailController,
            passwordController: passwordController,
          ),
          const SizedBox(
            height: 24,
          ),
          const ORDivider(),
          const SizedBox(
            height: 24,
          ),
          const ContactSupportButton(),
          const SizedBox(
            height: 12,
          ),
          const VersionInfo(),
        ],
      ),
    );
  }
}
