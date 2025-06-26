import 'package:flutter/material.dart';
import 'package:uccd/generated/l10n.dart';

class InstructorCoursesEmptyState extends StatelessWidget {
  const InstructorCoursesEmptyState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.school_outlined,
            size: 64,
            color: Colors.grey,
          ),
          SizedBox(height: 16),
          Text(
            S.of(context).noCoursesAssignedYet,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.grey,
                ),
          ),
          SizedBox(height: 8),
          Text(
            S.of(context).coursesWillAppearAssigned,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
