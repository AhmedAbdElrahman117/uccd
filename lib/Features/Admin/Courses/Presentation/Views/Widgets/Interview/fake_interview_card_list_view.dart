import 'package:flutter/material.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Interview/fake_interview_card.dart';

class FakeInterviewCardListView extends StatelessWidget {
  const FakeInterviewCardListView({
    super.key,
    this.isAcceptedList,
  });

  final bool? isAcceptedList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: FakeInterviewCard(
            isAcceptedList: isAcceptedList,
          ),
        );
      },
    );
  }
}
