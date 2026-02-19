import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Core/Models/student_model.dart';
import 'package:uccd/Core/Models/user_model.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/Features/Profile/Presentation/Views/Widgets/control_panel.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.userName,
    required this.info,
    required this.onEdit,
    required this.onDelete,
    required this.deleteMessage,
    this.deleteImage,
    this.student,
  });

  final String userName;
  final Widget info;
  final UserModel? student;
  final void Function() onEdit;
  final void Function() onDelete;
  final String deleteMessage;
  final String? deleteImage;

  @override
  Widget build(BuildContext context) {
    return AdaptiveContainer(
      verticalPadding: 6,
      horizontalPadding: 12,
      child: Column(
        spacing: 8,
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 18,
              backgroundColor: AppColor.primary.withValues(alpha: 0.2),
              child: Text(
                userName[0].toUpperCase(),
                style: AppText.style16Bold(context).copyWith(
                  color: AppColor.primary,
                ),
              ),
            ),
            title: Text(
              userName,
              style: AppText.style17Bold(context),
            ),
            subtitle: info,
            trailing: student != null
                ? IconButton(
                    onPressed: () {
                      OverlayController.showStudentInfoDialog(
                        context,
                        StudentModel.fromUser(student!),
                      );
                    },
                    icon: const Icon(FontAwesomeIcons.circleInfo),
                  )
                : null,
            minVerticalPadding: 0,
          ),
          const Divider(),
          ControlPanel(
            onEdit: onEdit,
            onDelete: onDelete,
            deleteMessage: deleteMessage,
            image: deleteImage,
          ),
        ],
      ),
    );
  }
}
