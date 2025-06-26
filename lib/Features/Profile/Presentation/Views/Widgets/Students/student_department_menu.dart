import 'package:flutter/material.dart';
import 'package:uccd/generated/l10n.dart';

class StudentDepartmentMenu extends StatefulWidget {
  const StudentDepartmentMenu({super.key, required this.departmentController});

  final TextEditingController departmentController;

  @override
  State<StudentDepartmentMenu> createState() => _StudentDepartmentMenuState();
}

class _StudentDepartmentMenuState extends State<StudentDepartmentMenu> {
  Map<String, String> _getDepartments(BuildContext context) {
    return {
      S.of(context).informationTechnology: 'Information Technology',
      S.of(context).mechatronics: 'Mechatronics',
      S.of(context).autotronics: 'Autotronics',
      S.of(context).renewableEnergy: 'Renewable Energy',
      S.of(context).orthoticsProsthetics: 'O&P',
    };
  }

  @override
  Widget build(BuildContext context) {
    final departments = _getDepartments(context);
    return DropdownButtonFormField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.person),
        hintText: S.of(context).departmentHint,
      ),
      value: departments.values.contains(widget.departmentController.text)
          ? widget.departmentController.text
          : null,
      items: departments.entries
          .map(
            (e) => DropdownMenuItem(
              value: e.value,
              child: Text(e.key),
            ),
          )
          .toList(),
      onChanged: (value) {
        widget.departmentController.text = value ?? '';
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).selectDepartment;
        }
        return null;
      },
    );
  }
}
