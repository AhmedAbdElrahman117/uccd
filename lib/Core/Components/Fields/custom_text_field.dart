import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uccd/Core/theme_helper.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.textController,
    required this.label,
    required this.hint,
    this.validator,
    this.icon,
    this.keyboardType,
    this.onTap,
    this.canRequestFocus,
    this.maxLines = 1,
    this.suffix,
    this.enabled,
    this.onChanged,
    this.errorText,
  });

  final TextEditingController? textController;
  final String label;
  final String hint;
  final String? Function(String? value)? validator;
  final IconData? icon;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final bool? canRequestFocus;
  final int? maxLines;
  final Widget? suffix;
  final bool? enabled;
  final void Function(String value)? onChanged;
  final String? errorText;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textController,
      style: ThemeHelper.style16Bold(context).copyWith(
        fontWeight: FontWeight.w400,
      ),
      inputFormatters: widget.keyboardType == TextInputType.number
          ? [FilteringTextInputFormatter.digitsOnly]
          : null,
      enabled: widget.enabled,
      autocorrect: false,
      enableSuggestions: false,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      decoration: ThemeHelper.getInputDecoration(
        context,
        labelText: widget.label,
        hintText: widget.hint,
        prefixIcon: widget.icon != null
            ? Icon(
                widget.icon,
                size: 26,
                color: context.iconColor,
              )
            : null,
        suffixIcon: widget.suffix,
      ),
      validator: widget.validator,
      onTap: widget.onTap,
      canRequestFocus: widget.canRequestFocus ?? true,
      maxLines: widget.maxLines,
      onChanged: widget.onChanged,
      forceErrorText: widget.errorText,
    );
  }

  OutlineInputBorder border({Color color = Colors.black}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(15),
    );
  }
}


//  InputDecoration(
//         border: border(),
//         enabledBorder: border(),
//         focusedBorder: border(color: Colors.green),
//         errorBorder: border(color: Colors.red),
//         labelText: widget.label,
//         labelStyle: const TextStyle(
//           color: Colors.black,
//           fontSize: 18,
//         ),
        // hintText: widget.hint,
        // hintFadeDuration: const Duration(milliseconds: 100),
//         hintStyle: TextStyle(
//           color: Colors.grey.shade500,
//           fontSize: 20,
//         ),
        // alignLabelWithHint: true,
        // prefixIcon: const Icon(Icons.email),
//       ),