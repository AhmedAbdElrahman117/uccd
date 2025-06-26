import 'package:flutter/material.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/generated/l10n.dart';

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
        text: S.of(context).verificationEmailSent,
        style: AppText.style16Regular(context),
        children: [
          TextSpan(
            text: email,
            style: AppText.style16Bold(context),
          ),
          TextSpan(
            text: S.of(context).verificationEmailInbox,
            style: AppText.style16Regular(context),
          )
        ],
      ),
    );
  }
}
