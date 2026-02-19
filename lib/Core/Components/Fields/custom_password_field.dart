import 'package:flutter/material.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Core/theme_helper.dart';
import 'package:uccd/generated/l10n.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    super.key,
    required this.passwordController,
    required this.label,
    required this.hint,
  });

  final TextEditingController passwordController;
  final String label;
  final String hint;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool isSelected = true;
  bool isFocused = false;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    focusNode.addListener(
      () {
        isFocused = focusNode.hasFocus;
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordController,
      style: AppText.style14Regular(context),
      focusNode: focusNode,
      cursorOpacityAnimates: true,
      obscureText: isSelected,
      decoration: ThemeHelper.getInputDecoration(
        context,
        labelText: widget.label,
        hintText: widget.hint,
        prefixIcon: Icon(
          Icons.lock_outline,
          size: 24,
          color: context.iconColor,
        ),
        suffixIcon: Visibility(
          visible: isFocused,
          child: IconButton(
            onPressed: () {
              isSelected = !isSelected;
              setState(() {});
            },
            icon: Icon(
              Icons.visibility,
              color: context.iconColor,
            ),
            selectedIcon: Icon(
              Icons.visibility_off,
              color: context.iconColor,
            ),
            isSelected: isSelected,
            style: IconButton.styleFrom(),
            padding: const EdgeInsets.only(
              right: 16,
              left: 16,
            ),
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return S.of(context).passwordRequired;
        } else if (value.length < 8) {
          return S.of(context).passwordLengthError;
        }
        return null;
      },
    );
  }

  OutlineInputBorder border({Color color = Colors.black}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(15),
    );
  }
}
