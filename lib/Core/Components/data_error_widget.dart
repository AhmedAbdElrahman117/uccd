import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:uccd/Core/app_text.dart';

class DataErrorWidget extends StatelessWidget {
  const DataErrorWidget({
    super.key,
    this.message,
  });

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 16,
      children: [
        Lottie.asset(
          'assets/lotties/no internet.json',
          width: 120,
          height: 120,
          fit: BoxFit.cover,
          frameRate: FrameRate.max,
        ),
        Center(
          child: SelectableText(
            message ??
                'Failed to retrieve Data\nCheck your Internet Connection and try again',
            style: AppText.style16Bold(context),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
