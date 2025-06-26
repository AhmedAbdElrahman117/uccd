import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jiffy/jiffy.dart';
import 'package:uccd/Core/Components/Fields/custom_text_field.dart';
import 'package:uccd/Core/constants.dart';

class DatePickerField extends StatelessWidget {
  const DatePickerField({
    super.key,
    required this.dateController,
    required this.label,
    required this.hint,
    this.validator,
    this.icon,
    this.onChanged,
    this.onTap,
    this.errorText,
  });

  final TextEditingController dateController;
  final String label;
  final String hint;
  final String? Function(String? value)? validator;
  final IconData? icon;
  final void Function(String value)? onChanged;
  final void Function()? onTap;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      textController: dateController,
      label: label,
      hint: hint,
      canRequestFocus: false,
      icon: icon ?? FontAwesomeIcons.solidCalendar,
      errorText: errorText,
      onTap: onTap ??
          () async {
            DateTime? selectedDate = await showDatePicker(
              context: context,
              locale: Localizations.localeOf(context),
              firstDate: DateTime(2018),
              lastDate: DateTime(2500),
              currentDate: DateTime.now(),
            );
            if (selectedDate != null) {
              Jiffy date = Jiffy.parseFromDateTime(
                selectedDate,
              );
              dateController.text = date.format(pattern: dateFormat);
            }
          },
      validator: validator,
    );
  }
}
