import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:uccd/Core/app_color.dart';

Widget mainLoading = LoadingAnimationWidget.fourRotatingDots(
  color: AppColor.primary,
  size: 60,
);

Widget getSubLoading({required double size}) {
  return LoadingAnimationWidget.threeArchedCircle(
    color: AppColor.primary,
    size: size,
  );
}

String dateFormat = 'dd-MM-yyyy';
