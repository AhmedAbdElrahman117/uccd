import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/custom_info.dart';

class CourseLearningsList extends StatelessWidget {
  const CourseLearningsList({super.key, this.goals});

  final List<dynamic>? goals;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: goals?.length ?? 0,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return CustomInfo(
          info: goals![index],
          icon: Icons.check_circle,
          iconColor: Colors.green,
          fontSize: 14,
        );
      },
    );
  }
}
