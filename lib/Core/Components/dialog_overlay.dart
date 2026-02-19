import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:uccd/Core/Components/overlay_background.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/generated/l10n.dart';

class DialogOverlay extends StatelessWidget {
  const DialogOverlay({
    super.key,
    required this.image,
    required this.title,
    required this.message,
    required this.confirmButtonText,
    this.onCancel,
    required this.confirmButtonColor,
    this.onConfirm,
    this.confirmIcon,
  });

  final String image;
  final String title;
  final String message;
  final String confirmButtonText;
  final Color confirmButtonColor;
  final void Function()? onCancel;
  final void Function()? onConfirm;
  final Icon? confirmIcon;

  @override
  Widget build(BuildContext context) {
    return OverlayBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            image,
            width: 120,
            height: 120,
            repeat: false,
            frameRate: FrameRate.max,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Text(error.toString());
            },
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: AppText.style18Bold(context),
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: AppText.style16Bold(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 32,
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onCancel,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  icon: Icon(
                    Icons.close,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  label: Text(
                    S.of(context).cancel,
                    style: AppText.style14Bold(context),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: onConfirm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: confirmButtonColor,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  icon: confirmIcon,
                  label: Text(
                    confirmButtonText,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
