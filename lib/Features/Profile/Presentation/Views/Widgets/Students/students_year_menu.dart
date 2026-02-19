import 'package:flutter/material.dart';
import 'package:uccd/generated/l10n.dart';

class StudentYearMenu extends StatefulWidget {
  const StudentYearMenu({super.key, required this.yearController});

  final TextEditingController yearController;

  @override
  State<StudentYearMenu> createState() => _StudentYearMenuState();
}

class _StudentYearMenuState extends State<StudentYearMenu> {
  Map<String, String> _getYears(BuildContext context) {
    return {
      S.of(context).firstYear: '1st year',
      S.of(context).secondYear: '2nd year',
      S.of(context).thirdYear: '3rd year',
      S.of(context).fourthYear: '4th year',
    };
  }

  @override
  Widget build(BuildContext context) {
    final years = _getYears(context);
    return DropdownButtonFormField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.person),
        hintText: S.of(context).yearHint,
      ),
      value: years.values.contains(widget.yearController.text)
          ? widget.yearController.text
          : null,
      items: years.entries
          .map(
            (e) => DropdownMenuItem(
              value: e.value,
              child: Text(e.key),
            ),
          )
          .toList(),
      onChanged: (value) {
        widget.yearController.text = value ?? '';
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).selectYear;
        }
        return null;
      },
    );
  }
}
