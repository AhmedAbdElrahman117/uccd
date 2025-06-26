import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/Models/student_model.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Interview/interview_card.dart';

class InterviewList extends StatefulWidget {
  const InterviewList({
    super.key,
    this.isAcceptedList,
    required this.data,
    required this.course,
  });

  final bool? isAcceptedList;
  final List<StudentModel> data;
  final CourseModel course;

  @override
  State<InterviewList> createState() => _InterviewListState();
}

class _InterviewListState extends State<InterviewList>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      sliver: SliverList.builder(
        itemCount: widget.data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: InterviewCard(
              isAcceptedList: widget.data[index].isAccepted,
              student: widget.data[index],
              course: widget.course,
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
//  return ListView.builder(
//       itemCount: widget.data.length,
      // padding: const EdgeInsets.symmetric(
      //   horizontal: 16,
      //   vertical: 12,
      // ),
      // itemBuilder: (context, index) {
      //   return Padding(
      //     padding: const EdgeInsets.symmetric(vertical: 12),
      //     child: InterviewCard(
      //       isAcceptedList: widget.data[index].isAccepted,
      //       student: widget.data[index],
      //       course: widget.course,
      //     ),
      //   );
      // },
//     );
