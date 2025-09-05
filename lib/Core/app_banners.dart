import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class AppBanners {
  static void showFailed(
      {required String message, AlignmentGeometry? alignment}) {
    toastification.show(
      type: ToastificationType.error,
      style: ToastificationStyle.flatColored,
      title: const Text("Error"),
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
      closeButtonShowType: CloseButtonShowType.none,
      dragToClose: true,
      applyBlurEffect: true,
      closeOnClick: true,
      showProgressBar: false,
    );
  }

  static void showSuccess(
      {required String message, AlignmentGeometry? alignment}) {
    toastification.show(
      type: ToastificationType.success,
      style: ToastificationStyle.flatColored,
      title: const Text("Success"),
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
      closeButtonShowType: CloseButtonShowType.none,
      dragToClose: true,
      applyBlurEffect: true,
      closeOnClick: true,
      showProgressBar: false,
    );
  }

  static void showLikeSuccess(
      {required String message, AlignmentGeometry? alignment}) {
    toastification.show(
      type: ToastificationType.success,
      style: ToastificationStyle.flatColored,
      title: const Text("Success"),
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
      closeButtonShowType: CloseButtonShowType.none,
      dragToClose: true,
      applyBlurEffect: true,
      closeOnClick: true,
      showProgressBar: false,
    );
  }

  static void showLikeFailed(
      {required String message, AlignmentGeometry? alignment}) {
    toastification.show(
      type: ToastificationType.error,
      style: ToastificationStyle.flatColored,
      title: const Text("Success"),
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
      closeButtonShowType: CloseButtonShowType.none,
      dragToClose: true,
      applyBlurEffect: true,
      closeOnClick: true,
      showProgressBar: false,
    );
  }

  static void showResentEmail(
      {required String message, AlignmentGeometry? alignment}) {
    toastification.show(
      type: ToastificationType.info,
      style: ToastificationStyle.flatColored,
      title: const Text("Code Resent"),
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
      closeButtonShowType: CloseButtonShowType.none,
      dragToClose: true,
      applyBlurEffect: true,
      closeOnClick: true,
      showProgressBar: false,
    );
  }

  static void showFailedEmail(
      {required String message, AlignmentGeometry? alignment}) {
    toastification.show(
      type: ToastificationType.error,
      style: ToastificationStyle.flatColored,
      title: const Text("Failed"),
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
      closeButtonShowType: CloseButtonShowType.none,
      dragToClose: true,
      applyBlurEffect: true,
      closeOnClick: true,
      showProgressBar: false,
    );
  }
}
