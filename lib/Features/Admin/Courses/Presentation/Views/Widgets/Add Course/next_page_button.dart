import 'package:flutter/material.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/generated/l10n.dart';

class NextPageButton extends StatelessWidget {
  const NextPageButton({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      label: Text(
        S.of(context).Next,
        style: AppText.style14Bold(context),
      ),
      icon: Icon(
        Icons.keyboard_arrow_right_sharp,
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }
}
