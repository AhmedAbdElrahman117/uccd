import 'package:flutter/material.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/disability_options.dart';

class DisabilitySection extends StatelessWidget {
  const DisabilitySection({super.key, required this.disabilityController});

  final TextEditingController disabilityController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Disability:',
          style: AppText.style16Bold(context),
        ),
        const SizedBox(height: 12),
        DisabilityOptions(
          disabilityController: disabilityController,
        ),
      ],
    );
  }
}
