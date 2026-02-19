import 'package:flutter/material.dart';
import 'package:uccd/Core/app_assets.dart';
import 'package:uccd/Core/theme_helper.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({
    super.key,
    required this.message,
    this.showImage = true,
  });

  final String message;
  final bool? showImage;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: ThemeHelper.gap16.height!,
      children: [
        // Lottie.asset(
        //   AppAssets.imagesNodata,
        //   height: 120,
        //   fit: BoxFit.cover,
        //   frameRate: const FrameRate(30),
        // ),
        Visibility(
          visible: showImage!,
          child: Image.asset(
            AppAssets.imagesNoData,
            width: 100,
            height: 100,
          ),
        ),
        Center(
          child: Text(
            message,
            style: ThemeHelper.style16Bold(context),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
