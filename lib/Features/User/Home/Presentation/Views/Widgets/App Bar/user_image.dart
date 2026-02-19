import 'package:flutter/material.dart';
import 'package:uccd/Core/app_assets.dart';
import 'package:uccd/Core/app_color.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    super.key,
    this.radius,
  });

  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
          border: Border.all(
            color: AppColor.primary,
          ),
        ),
        child: CircleAvatar(
          backgroundImage: const AssetImage(
            AppAssets.imagesUCCDGrouplogo3,
          ),
          radius: radius ?? 28,
        ),
      ),
    );
  }
}
