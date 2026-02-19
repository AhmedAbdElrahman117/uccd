import 'package:flutter/material.dart';
import 'package:uccd/Core/app_text.dart';

class PreviousPageButton extends StatelessWidget {
  const PreviousPageButton({
    super.key,
    required this.isZero,
    this.onPressed,
  });

  final bool isZero;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isZero == false,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        label: Text(
          'Back',
          style: AppText.style14Bold(context),
        ),
        icon: Icon(
          Icons.keyboard_arrow_left_sharp,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}
