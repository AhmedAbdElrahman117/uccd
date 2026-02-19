import 'package:flutter/material.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/disability_options.dart';
import 'package:uccd/generated/l10n.dart';

class DisabilitySection extends StatelessWidget {
  const DisabilitySection({super.key, required this.disabilityController});

  final TextEditingController disabilityController;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${S.of(context).Disability}:',
          style: AppText.style16Bold(context),
        ),
        DisabilityOptions(
          disabilityController: disabilityController,
        ),
      ],
    );
  }
}
