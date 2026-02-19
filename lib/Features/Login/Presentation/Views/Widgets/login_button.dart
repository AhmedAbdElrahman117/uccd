import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Components/custom_button.dart';
import 'package:uccd/Features/Login/Presentation/Views%20Model/Login%20Cubit/login_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: CustomButton(
        title: 'Login',
        onPressed: () {
          if (formKey.currentState!.validate()) {
            BlocProvider.of<LoginCubit>(context).login(
              email: emailController.text,
              password: passwordController.text,
            );
          }
        },
      ),
    );
  }
}
