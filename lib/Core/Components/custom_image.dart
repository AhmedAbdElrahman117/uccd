import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:uccd/Core/app_assets.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.height,
    this.image,
    this.topLeftRadius = 0,
    this.topRightRadius = 0,
    this.bottomLeftRadius = 0,
    this.bottomRightRadius = 0,
    this.fadeFrom = 1,
  });

  final double height;
  final String? image;
  final double? topLeftRadius;
  final double? topRightRadius;
  final double? bottomLeftRadius;
  final double? bottomRightRadius;
  final double? fadeFrom;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeftRadius!),
        topRight: Radius.circular(topRightRadius!),
        bottomLeft: Radius.circular(bottomLeftRadius!),
        bottomRight: Radius.circular(bottomRightRadius!),
      ),
      child: image == null
          ? Image.asset(
              AppAssets.imagesUCCDLOGO,
              height: height,
              width: double.infinity,
              fit: BoxFit.contain,
            )
          : ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    fadeFrom!,
                    1,
                  ],
                  colors: const [
                    Colors.white,
                    Colors.transparent,
                  ],
                ).createShader(
                  Rect.fromLTRB(0, 0, rect.width, rect.height),
                );
              },
              child: CachedNetworkImage(
                imageUrl: image!,
                height: height,
                width: double.infinity,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) {
                  return const SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Center(
                      child: Icon(
                        Icons.broken_image,
                      ),
                    ),
                  );
                },
                placeholder: (context, url) {
                  return Skeletonizer(
                    enabled: true,
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
    );
  }
}

class TransparentBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addRect(
        Rect.fromLTRB(0, 0, size.width, size.height)); // Full rectangle path
    path.lineTo(0, size.height - 50); // Start the transparency gradient line
    path.quadraticBezierTo(size.width / 2, size.height, size.width,
        size.height - 50); // Create a curve for the transparent effect
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
