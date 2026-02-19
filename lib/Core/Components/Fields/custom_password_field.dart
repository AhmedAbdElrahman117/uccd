import 'package:flutter/material.dart';

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
      style: TextStyle(
        color: Theme.of(context).brightness.index == 1
            ? Colors.black
            : Colors.white,
        fontSize: 20,
      ),
      focusNode: focusNode,
      cursorOpacityAnimates: true,
      obscureText: isSelected,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        hintFadeDuration: const Duration(milliseconds: 100),
        alignLabelWithHint: true,
        prefixIcon: Icon(
          Icons.lock,
          size: 24,
          color: Theme.of(context).iconTheme.color,
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
              color: Theme.of(context).iconTheme.color,
            ),
            selectedIcon: Icon(
              Icons.visibility_off,
              color: Theme.of(context).iconTheme.color,
            ),
            isSelected: isSelected,
            style: IconButton.styleFrom(),
            padding: const EdgeInsets.only(right: 12),
          ),
        ),
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password Required';
        } else if (value.length < 8) {
          return 'Password must be at Least 8 Characters';
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
// InputDecoration(
//         border: border(),
//         enabledBorder: border(),
//         focusedBorder: border(color: Colors.green),
//         errorBorder: border(color: Colors.red),
        // labelText: widget.label,
//         labelStyle: const TextStyle(
//           color: Colors.black,
//           fontSize: 18,
//         ),
        // hintText: widget.hint,
        // hintFadeDuration: const Duration(milliseconds: 100),
        // alignLabelWithHint: true,
//         hintStyle: TextStyle(
//           color: Colors.grey.shade500,
//           fontSize: 20,
//         ),
        // prefixIcon: const Icon(
        //   FontAwesomeIcons.lock,
        //   size: 20,
        // ),
        // suffixIcon: Visibility(
        //   visible: isFocused,
        //   child: IconButton(
        //     onPressed: () {
        //       isSelected = !isSelected;
        //       setState(() {});
        //     },
        //     icon: const Icon(FontAwesomeIcons.solidEye),
        //     selectedIcon: const Icon(FontAwesomeIcons.solidEyeSlash),
        //     isSelected: isSelected,
        //     style: IconButton.styleFrom(),
        //     padding: const EdgeInsets.only(right: 12),
        //   ),
        // ),
//       ),