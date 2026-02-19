import 'package:flutter/material.dart';
import 'package:uccd/Core/app_text.dart';

class ItemDescription extends StatelessWidget {
  const ItemDescription({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Text(
            'Description:',
            style: AppText.style22Bold(context),
          ),
          Text(
            description,
            style: AppText.style18Bold(context),
          ),
        ],
      ),
    );
  }
}
