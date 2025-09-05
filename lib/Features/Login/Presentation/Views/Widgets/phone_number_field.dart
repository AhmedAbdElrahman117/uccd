import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/Fields/alpha_numeric_field.dart';

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
      label: 'Phone',
      hint: 'Enter your Phone Number',
      keyboardType: TextInputType.number,
      icon: Icons.phone,
      validator: (value) {
        final regex = RegExp(r'^(010|011|012|015)[0-9]{8}$');
        if (value!.isEmpty) {
          return 'Required Field';
        } else if (value.length < 11) {
          return 'Phone Number are less Than 11 Numbers';
        } else if (!regex.hasMatch(value)) {
          return 'Invalid Phone Number';
        }
        return null;
      },
    );
  }
}
