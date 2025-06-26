import 'package:flutter/material.dart';
import 'package:uccd/Core/app_text.dart';

class ActionCard extends StatelessWidget {
  const ActionCard({
    super.key,
    required this.title,
    this.onTap,
  });

  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      margin: EdgeInsets.zero,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              const Icon(Icons.add),
              Text(
                title,
                style: AppText.style14Bold(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
