import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/Login/Presentation/Views%20Model/Verification%20Cubit/verification_cubit.dart';
import 'package:uccd/generated/l10n.dart';

class ResentCodeText extends StatelessWidget {
  const ResentCodeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: '${S.of(context).didntRecieveCode} ',
          style: AppText.style16Regular(context),
          children: [
            TextSpan(
              text: S.of(context).rensendCode,
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
