import 'package:flutter/material.dart';

extension ResponsiveExtension on BuildContext {
  // Screen Dimensions
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;

  // Percentage Helpers
  double wp(double percent) => screenWidth * (percent / 100);
  double hp(double percent) => screenHeight * (percent / 100);

  // Standardized Responsive Icon / Spacing Sizes
  double get iconSmall => screenWidth * 0.04;
  double get iconMedium => screenWidth * 0.07;
  double get iconLarge => screenWidth * 0.10;
}