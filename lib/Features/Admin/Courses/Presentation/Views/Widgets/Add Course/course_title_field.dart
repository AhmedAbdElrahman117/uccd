import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uccd/Core/Components/Fields/alpha_numeric_field.dart';

class CourseTitleField extends StatelessWidget {
  const CourseTitleField({
    super.key,
    required this.titleController,
  });

  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return AlphaNumericField(
      controller: titleController,
      label: 'Course Title',
      hint: 'Enter Course Title',
      icon: FontAwesomeIcons.bookOpen,
    );
  }
}
