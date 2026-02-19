import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/log_model.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/Logs/log_card.dart';

class LogsListView extends StatelessWidget {
  const LogsListView({
    super.key,
    required this.logs,
  });

  final List<LogModel> logs;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      sliver: SliverList.builder(
        itemCount: logs.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: LogCard(
              log: logs[index],
            ),
          );
        },
      ),
    );
  }

  // LogModel(
  //               userName: 'Ahmed',
  //               userEmail: 'ahmed11@gmail.com',
  //               action: 'Add Course',
  //               actionType: 'Add',
  //               createdAt: Timestamp.now(),
  //             ),
}
