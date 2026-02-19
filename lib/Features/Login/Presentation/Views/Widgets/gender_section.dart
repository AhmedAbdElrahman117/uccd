import 'package:flutter/material.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/gender_options.dart';

class GenderSection extends StatelessWidget {
  const GenderSection({super.key, required this.genderController});

  final TextEditingController genderController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gender:',
          style: AppText.style16Bold(context),
        ),
        const SizedBox(height: 12),
        GenderOptions(
          genderController: genderController,
        ),
      ],
    );
  }
}
