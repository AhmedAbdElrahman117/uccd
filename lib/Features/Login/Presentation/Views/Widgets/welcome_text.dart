import 'package:flutter/material.dart';
import 'package:uccd/Core/app_text.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 40),
        child: Text(
          'Welcome to UCCD',
          style: AppText.style28Bold(context),
        ),
      ),
    );
  }
}
