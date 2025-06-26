import 'package:flutter/material.dart';
import 'package:uccd/Core/app_assets.dart';
import 'package:uccd/Core/app_color.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    super.key,
    this.radius,
    this.onTap,
  });

  final double? radius;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
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
      ),
    );
  }
}
