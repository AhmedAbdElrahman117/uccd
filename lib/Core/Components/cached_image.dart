import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    super.key,
    this.imageUrl,
    this.fallbackImage,
    this.topRadius,
    this.bottomRadius,
    this.height,
  });

  final String? imageUrl;
  final String? fallbackImage;
  final double? topRadius;
  final double? bottomRadius;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return imageUrl != null && imageUrl!.isNotEmpty
        ? ClipRRect(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(bottomRadius ?? 0),
              top: Radius.circular(topRadius ?? 0),
            ),
            child: CachedNetworkImage(
              imageUrl: imageUrl!,
              width: double.infinity,
              fit: BoxFit.cover,
              height: height,
              placeholder: (context, url) => Skeletonizer(
                enabled: true,
                child: Container(
                  color: Colors.grey,
                  height: 300,
                  width: double.infinity,
                ),
              ),
              errorWidget: (context, url, error) => Column(
                spacing: 12,
                children: [
                  Container(
                    color: AppColor.primary.withValues(alpha: 0.1),
                    child: const Icon(
                      Icons.image_not_supported_rounded,
                      color: Colors.red,
                      size: 40,
                    ),
                  ),
                  Text(
                    'Failed to load image',
                    style: AppText.style14Regular(context).copyWith(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          )
        : fallbackImage != null && fallbackImage!.isNotEmpty
            ? Image.asset(
                fallbackImage!,
                fit: BoxFit.contain,
                height: height,
                width: double.infinity,
              )
            : const SizedBox.shrink();
  }
}
