import 'package:flutter/material.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';

class PublisherLogo extends StatelessWidget {
  const PublisherLogo({
    super.key,
    required this.publisherName,
  });

  final String publisherName;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: AppColor.primary.withAlpha(51),
      child: Text(
        publisherName.isNotEmpty ? publisherName[0].toUpperCase() : '?',
        style: AppText.style18Bold(context).copyWith(
          color: AppColor.primary,
        ),
      ),
    );
  }
}
