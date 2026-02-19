import 'package:flutter/material.dart';
import 'package:uccd/Core/app_assets.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 140,
      margin: const EdgeInsets.only(bottom: 40),
      clipBehavior: Clip.none,
      decoration: const BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage(
            AppAssets.imagesUCCDLOGO,
          ),
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}
