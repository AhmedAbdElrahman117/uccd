import 'package:flutter/material.dart';
import 'package:uccd/Core/app_text.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppText.style20Bold(context),
      textAlign: TextAlign.start,
    );
  }
}
