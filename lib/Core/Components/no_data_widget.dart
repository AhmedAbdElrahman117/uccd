import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:uccd/Core/app_assets.dart';
import 'package:uccd/Core/app_text.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 16,
      children: [
        Lottie.asset(
          AppAssets.imagesNodata,
          height: 120,
          fit: BoxFit.cover,
          frameRate: const FrameRate(30),
        ),
        Center(
          child: Text(
            message,
            style: AppText.style16Bold(context),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
