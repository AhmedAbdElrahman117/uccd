import 'package:flutter/material.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/Quick%20Action/enhanced_action_card.dart';

class EnhancedActionsGrid extends StatelessWidget {
  const EnhancedActionsGrid({
    super.key,
    required this.actions,
  });

  final List<Map<String, dynamic>> actions;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: actions.length,
      itemBuilder: (context, index) {
        return EnhancedActionCard(
          icon: actions[index]['icon'],
          title: actions[index]['title'],
          subtitle: actions[index]['subtitle'],
          gradient: actions[index]['gradient'],
          onTap: actions[index]['onTap'],
        );
      },
    );
  }
}
