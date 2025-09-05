import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/Login/Presentation/Views%20Model/Verification%20Cubit/verification_cubit.dart';

class ResentCodeText extends StatelessWidget {
  const ResentCodeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: 'Didn\'t Recieve a Code? ',
          style: AppText.style16Regular(context),
          children: [
            TextSpan(
              text: 'Resend Code',
              style: AppText.style16Bold(context).copyWith(
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.double,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  BlocProvider.of<VerificationCubit>(context).sendEmail();
                },
            ),
          ],
        ),
      ),
    );
  }
}
