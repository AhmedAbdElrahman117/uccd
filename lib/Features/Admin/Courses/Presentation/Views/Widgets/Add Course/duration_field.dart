import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/Fields/alpha_numeric_field.dart';
import 'package:uccd/generated/l10n.dart';

class DurationField extends StatelessWidget {
  const DurationField({
    super.key,
    required this.durationController,
  });

  final TextEditingController durationController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AlphaNumericField(
        controller: durationController,
        label: S.of(context).durationLabel,
        hint: S.of(context).durationHint,
        icon: Icons.watch_later_rounded,
        keyboardType: TextInputType.number,
      ),
    );
  }
}
