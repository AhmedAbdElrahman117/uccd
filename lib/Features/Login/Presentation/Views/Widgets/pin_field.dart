import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/Admin/admin_view.dart';

class PinField extends StatelessWidget {
  const PinField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 5,
      defaultPinTheme: PinTheme(
        height: 53,
        width: 53,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.grey,
            width: 1.8,
          ),
        ),
        textStyle: AppText.style14Bold(context),
        margin: const EdgeInsets.all(6),
      ),
      errorPinTheme: PinTheme(
        height: 53,
        width: 53,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.red,
            width: 1.8,
          ),
        ),
        textStyle: AppText.style14Bold(context),
        margin: const EdgeInsets.all(6),
      ),
      pinAnimationType: PinAnimationType.fade,
      keyboardType: TextInputType.number,
      hapticFeedbackType: HapticFeedbackType.mediumImpact,
      validator: (value) {
        if (EmailOTP.verifyOTP(otp: value!) == false) {
          return 'Incorrect OTP';
        } else if (EmailOTP.isOtpExpired()) {
          return 'Invalid OTP Request another one';
        }
        return null;
      },
      onCompleted: (value) {
        if (EmailOTP.verifyOTP(otp: value)) {
          context.go(AdminView.id);
        }
      },
    );
  }
}
