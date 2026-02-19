import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/custom_info.dart';

class CourseLearningsList extends StatelessWidget {
  const CourseLearningsList({super.key, this.goals});

  final List<dynamic>? goals;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: goals?.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: CustomInfo(
            info: goals![index],
            icon: Icons.check,
            fontSize: 18,
          ),
        );
      },
    );
  }
}
