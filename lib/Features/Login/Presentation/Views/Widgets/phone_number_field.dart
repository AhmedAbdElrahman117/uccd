import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/Fields/alpha_numeric_field.dart';
import 'package:uccd/generated/l10n.dart';

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({
    super.key,
    required this.phoneNumberController,
  });

  final TextEditingController phoneNumberController;

  @override
  Widget build(BuildContext context) {
    return AlphaNumericField(
      controller: phoneNumberController,
      label: S.of(context).phoneNumber,
      hint: S.of(context).phoneNumberHint,
      keyboardType: TextInputType.number,
      icon: Icons.phone,
      validator: (value) {
        final regex = RegExp(r'^(010|011|012|015)[0-9]{8}$');
        if (value!.isEmpty) {
          return S.of(context).requiredField;
        } else if (value.length < 11) {
          return S.of(context).phoneNumberTooShort;
        } else if (!regex.hasMatch(value)) {
          return S.of(context).invalidPhoneNumber;
        }
        return null;
      },
    );
  }
}
