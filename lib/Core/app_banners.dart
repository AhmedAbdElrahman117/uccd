import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:uccd/generated/l10n.dart';

class AppBanners {
  static void showFailed(
      {required String message,
      AlignmentGeometry? alignment,
      BuildContext? context}) {
    toastification.show(
      type: ToastificationType.error,
      style: ToastificationStyle.flatColored,
      title: Text(context != null ? S.of(context).error : "Error"),
      description: Text(message),
      alignment: alignment ?? Alignment.topCenter,
      autoCloseDuration: const Duration(milliseconds: 3000),
      animationBuilder: (
        context,
        animation,
        alignment,
        child,
      ) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: highModeShadow,
      dragToClose: true,
      applyBlurEffect: true,
      closeOnClick: true,
      showProgressBar: false,
    );
  }

  static void showSuccess(
      {required String message,
      AlignmentGeometry? alignment,
      String? title,
      BuildContext? context}) {
    toastification.show(
      type: ToastificationType.success,
      style: ToastificationStyle.flatColored,
      title:
          Text(title ?? (context != null ? S.of(context).success : "Success")),
      description: Text(message),
      alignment: alignment ?? Alignment.topCenter,
      autoCloseDuration: const Duration(milliseconds: 3000),
      animationBuilder: (
        context,
        animation,
        alignment,
        child,
      ) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: highModeShadow,
      dragToClose: true,
      applyBlurEffect: true,
      closeOnClick: true,
      showProgressBar: false,
    );
  }

  static void showLikeSuccess(
      {required String message,
      AlignmentGeometry? alignment,
      BuildContext? context}) {
    toastification.show(
      type: ToastificationType.success,
      style: ToastificationStyle.flatColored,
      title: Text(context != null ? S.of(context).success : "Success"),
      description: Text(message),
      alignment: alignment ?? Alignment.bottomCenter,
      autoCloseDuration: const Duration(milliseconds: 1500),
      icon: const Icon(Icons.thumb_up),
      animationBuilder: (
        context,
        animation,
        alignment,
        child,
      ) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: highModeShadow,
      dragToClose: true,
      applyBlurEffect: true,
      closeOnClick: true,
      showProgressBar: false,
    );
  }

  static void showLikeFailed(
      {required String message,
      AlignmentGeometry? alignment,
      BuildContext? context}) {
    toastification.show(
      type: ToastificationType.error,
      style: ToastificationStyle.flatColored,
      title: Text(context != null ? S.of(context).success : "Success"),
      description: Text(message),
      alignment: alignment ?? Alignment.bottomCenter,
      autoCloseDuration: const Duration(milliseconds: 1500),
      icon: const Icon(Icons.thumb_up),
      animationBuilder: (
        context,
        animation,
        alignment,
        child,
      ) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: highModeShadow,
      dragToClose: true,
      applyBlurEffect: true,
      closeOnClick: true,
      showProgressBar: false,
    );
  }

  static void showResentEmail(
      {required String message,
      AlignmentGeometry? alignment,
      BuildContext? context}) {
    toastification.show(
      type: ToastificationType.info,
      style: ToastificationStyle.flatColored,
      title: Text(context != null ? S.of(context).codeResent : "Code Resent"),
      description: Text(message),
      alignment: alignment ?? Alignment.bottomCenter,
      autoCloseDuration: const Duration(milliseconds: 2500),
      icon: const Icon(Icons.email),
      animationBuilder: (
        context,
        animation,
        alignment,
        child,
      ) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: highModeShadow,
      dragToClose: true,
      applyBlurEffect: true,
      closeOnClick: true,
      showProgressBar: false,
    );
  }

  static void showFailedEmail(
      {required String message,
      AlignmentGeometry? alignment,
      BuildContext? context}) {
    toastification.show(
      type: ToastificationType.error,
      style: ToastificationStyle.flatColored,
      title: Text(context != null ? S.of(context).failed : "Failed"),
      description: Text(message),
      alignment: alignment ?? Alignment.bottomCenter,
      autoCloseDuration: const Duration(milliseconds: 2500),
      icon: const Icon(Icons.email),
      animationBuilder: (
        context,
        animation,
        alignment,
        child,
      ) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: highModeShadow,
      dragToClose: true,
      applyBlurEffect: true,
      closeOnClick: true,
      showProgressBar: false,
    );
  }

  static void showComingSoon(BuildContext context) {
    toastification.show(
      type: ToastificationType.info,
      style: ToastificationStyle.flatColored,
      title: Text(S.of(context).ComingSoon),
      description: Text(S.of(context).ComingSoonlabel),
      autoCloseDuration: const Duration(milliseconds: 2500),
      icon: const Icon(Icons.history),
      animationBuilder: (
        context,
        animation,
        alignment,
        child,
      ) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: highModeShadow,
      dragToClose: true,
      applyBlurEffect: true,
      closeOnClick: true,
      showProgressBar: false,
    );
  }
}
