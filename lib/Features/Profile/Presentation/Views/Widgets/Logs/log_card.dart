import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Core/Models/log_model.dart';
import 'package:uccd/Core/app_dates.dart';
import 'package:uccd/Core/app_text.dart';

class LogCard extends StatelessWidget {
  const LogCard({
    super.key,
    required this.log,
  });

  final LogModel log;

  @override
  Widget build(BuildContext context) {
    return AdaptiveContainer(
      verticalPadding: 10,
      horizontalPadding: 12,
      child: ListTile(
        leading: checkType(),
        title: RichText(
          text: TextSpan(
            text: '${log.userName} ',
            style: AppText.style16Regular(context),
            children: [
              TextSpan(
                text: log.action,
                style: AppText.style16Bold(context),
              ),
            ],
          ),
        ),
        subtitle: Text(
          '${log.userEmail}\n${AppDates.timeStampToStringTime(log.createdAt)}',
        ),
      ),
    );
  }

  Widget checkType() {
    switch (log.actionType) {
      case 'Add':
        return const CircleAvatar(
          backgroundColor: Color(0xff2196F3),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        );
      case 'Update':
        return const CircleAvatar(
          backgroundColor: Color(0xffFF9800),
          child: Icon(
            FontAwesomeIcons.solidPenToSquare,
            color: Colors.white,
          ),
        );
      case 'Delete':
        return const CircleAvatar(
          backgroundColor: Color(0xffF44336),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        );
      case 'Accept':
        return const CircleAvatar(
          backgroundColor: Color(0xff4CAF50),
          child: Icon(
            Icons.check,
            color: Colors.white,
          ),
        );
      case 'Reject':
        return const CircleAvatar(
          backgroundColor: Color(0xffD32F2F),
          child: Icon(
            Icons.close,
            color: Colors.white,
          ),
        );

      default:
        return const SizedBox();
    }
  }
}
