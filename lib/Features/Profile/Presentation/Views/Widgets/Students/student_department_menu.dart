import 'package:flutter/material.dart';

class StudentDepartmentMenu extends StatefulWidget {
  const StudentDepartmentMenu({super.key, required this.departmentController});

  final TextEditingController departmentController;

  @override
  State<StudentDepartmentMenu> createState() => _StudentDepartmentMenuState();
}

class _StudentDepartmentMenuState extends State<StudentDepartmentMenu> {
  final Map<String, String> departments = {
    'Information Technology': 'Information Technology',
    'Mechatronics': 'Mechatronics',
    'Autotronics': 'Autotronics',
    'Renewable Energy': 'Renewable Energy',
    'O&P': 'O&P',
  };
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.person),
        hintText: 'Department',
      ),
      value: departments[widget.departmentController.text],
      items: departments.entries.indexed
          .map(
            (e) => DropdownMenuItem(
              value: e.$2.value,
              child: Text(e.$2.key),
            ),
          )
          .toList(),
      onChanged: (value) {
        widget.departmentController.text = value ?? '';
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Select Department';
        }
        return null;
      },
    );
  }
}
