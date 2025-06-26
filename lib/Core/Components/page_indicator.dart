import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:uccd/Core/app_color.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.pageController,
    required this.pagesCount,
    this.onDotClicked,
  });

  final PageController pageController;
  final int pagesCount;
  final void Function(int index)? onDotClicked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 20),
      child: Center(
        child: SmoothPageIndicator(
          controller: pageController,
          count: pagesCount,
          effect: const WormEffect(
            activeDotColor: AppColor.primary,
            spacing: 20,
            dotHeight: 12,
            dotWidth: 12,
          ),
          onDotClicked: onDotClicked,
        ),
      ),
    );
  }
}
