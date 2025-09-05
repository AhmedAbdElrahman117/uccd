import 'package:flutter/material.dart';

class StudentYearMenu extends StatefulWidget {
  const StudentYearMenu({super.key, required this.yearController});

  final TextEditingController yearController;

  @override
  State<StudentYearMenu> createState() => _StudentYearMenuState();
}

class _StudentYearMenuState extends State<StudentYearMenu> {
  final Map<String, String> years = {
    '1st year': '1st year',
    '2nd year': '2nd year',
    '3rd year': '3rd year',
    '4th year': '4th year',
  };
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.person),
        hintText: 'year',
      ),
      value: years[widget.yearController.text],
      items: years.entries.indexed
          .map(
            (e) => DropdownMenuItem(
              value: e.$2.value,
              child: Text(e.$2.key),
            ),
          )
          .toList(),
      onChanged: (value) {
        widget.yearController.text = value ?? '';
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Select year';
        }
        return null;
      },
    );
  }
}
