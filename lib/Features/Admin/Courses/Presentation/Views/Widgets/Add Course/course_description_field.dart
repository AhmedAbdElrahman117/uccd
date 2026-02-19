import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uccd/Core/Components/Fields/description_field.dart';
import 'package:uccd/generated/l10n.dart';

class CourseDescriptionField extends StatelessWidget {
  const CourseDescriptionField({
    super.key,
    required this.descriptionController,
  });

  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return DescriptionField(
      controller: descriptionController,
      label: S.of(context).descriptionLabel,
      hint: S.of(context).descriptionHint,
      icon: FontAwesomeIcons.fileLines,
    );
  }
}
