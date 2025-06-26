import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:uccd/Core/app_assets.dart';
import 'package:uccd/Core/theme_helper.dart';
import 'package:uccd/generated/l10n.dart';

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
      spacing: ThemeHelper.gap16.height!,
      children: [
        Lottie.asset(
          AppAssets.imagesNointernet,
          width: 120,
          height: 120,
          fit: BoxFit.cover,
          frameRate: FrameRate.max,
        ),
        Center(
          child: SelectableText(
            message ??
                '${S.of(context).failedToLoadData}\n${S.of(context).checkInternetConnectionAndTryAgain}',
            style: ThemeHelper.style16Bold(context),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
