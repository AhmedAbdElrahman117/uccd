import 'package:flutter/material.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course%20Details/course_timeline.dart';

class TimelineItem extends StatelessWidget {
  const TimelineItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.status,
    this.isLast = false,
  });

  final String title;
  final String subtitle;
  final TimelineStatus status;
  final bool? isLast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Row(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: getStatusColor().withValues(
                    alpha: 0.1,
                  ),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: getStatusColor(),
                    width: 2,
                  ),
                ),
                child: Icon(
                  getStatusIcon(),
                  color: getStatusColor(),
                  size: 20,
                ),
              ),
              Visibility(
                visible: !isLast!,
                child: Container(
                  width: 2,
                  height: 40,
                  color: Colors.grey.withValues(
                    alpha: 0.5,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppText.style14Bold(context).copyWith(
                    color: getStatusColor(),
                  ),
                ),
                Text(
                  subtitle,
                  style: AppText.style12Regular(context).copyWith(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color getStatusColor() {
    switch (status) {
      case TimelineStatus.upcoming:
        return Colors.grey;
      case TimelineStatus.active:
        return Colors.green;
      case TimelineStatus.completed:
        return AppColor.primary;
    }
  }

  IconData getStatusIcon() {
    switch (status) {
      case TimelineStatus.upcoming:
        return Icons.schedule;
      case TimelineStatus.active:
        return Icons.play_circle_fill;
      case TimelineStatus.completed:
        return Icons.check_circle;
    }
  }
}
