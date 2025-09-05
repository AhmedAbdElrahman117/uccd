import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:uccd/Core/Components/overlay_background.dart';
import 'package:uccd/Core/app_text.dart';

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
  });

  final String image;
  final String title;
  final String message;
  final String confirmButtonText;
  final Color confirmButtonColor;
  final void Function()? onCancel;
  final void Function()? onConfirm;

  @override
  Widget build(BuildContext context) {
    return OverlayBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image.asset(
          //   image,
          //   width: 75,
          //   height: 75,
          // ),
          Lottie.asset(
            image,
            width: 120,
            height: 120,
            repeat: false,
            frameRate: FrameRate.max,
            fit: BoxFit.cover,
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
                child: OutlinedButton(
                  onPressed: onCancel,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Text(
                    'Cancel',
                    style: AppText.style14Bold(context),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: onConfirm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: confirmButtonColor,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Text(
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
