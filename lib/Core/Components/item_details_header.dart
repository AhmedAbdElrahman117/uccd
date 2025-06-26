import 'package:flutter/material.dart';
import 'package:uccd/Core/app_text.dart';

class ItemDetailsHeader extends StatelessWidget {
  const ItemDetailsHeader({
    super.key,
    required this.header,
  });

  final String header;

  @override
  Widget build(BuildContext context) {
    return Text(
      header,
      style: AppText.style22Bold(context),
    );
  }
}
