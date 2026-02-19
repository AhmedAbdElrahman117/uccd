import 'package:flutter/material.dart';
import 'package:uccd/Core/app_text.dart';

class InfoText extends StatelessWidget {
  const InfoText({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    return SelectableText.rich(
      textAlign: TextAlign.center,
      TextSpan(
        text: 'We Sent a Verification Email to ',
        style: AppText.style16Regular(context),
        children: [
          TextSpan(
            text: email,
            style: AppText.style16Bold(context),
          ),
          TextSpan(
            text: ' with an OTP Number please Check your Inbox',
            style: AppText.style16Regular(context),
          )
        ],
      ),
    );
  }
}
