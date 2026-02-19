import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uccd/Core/Components/Fields/description_field.dart';

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
      label: 'Description',
      hint: 'Enter Course Description',
      icon: FontAwesomeIcons.fileLines,
    );
  }
}
