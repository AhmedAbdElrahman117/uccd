import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/Hero/hero_image.dart';
import 'package:uccd/Core/app_text.dart';

class DetailsAppBar extends StatelessWidget {
  const DetailsAppBar({
    super.key,
    required this.tags,
    required this.imageLink,
  });

  final Map<String, String> tags;
  final String? imageLink;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.medium(
      expandedHeight: MediaQuery.sizeOf(context).height * 0.42,
      title: Text(
        'Details',
        style: AppText.style16Bold(context),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: HeroImage(
          tag: tags['Image'] ?? 'image',
          verticalPadding: 30,
          imageHeight: MediaQuery.sizeOf(context).height * 0.42,
          image: imageLink,
          fadeFrom: 0.85,
        ),
      ),
      snap: false,
      pinned: true,
      floating: false,
    );
  }
}
