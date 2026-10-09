import 'package:flutter/material.dart';

/// Centralized design tokens for spacing and padding across the app.
abstract final class AppSpacing {
  // Raw spacing values based on an 8-point grid
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 24.0;
  static const double xxl = 32.0;

  // Common EdgeInsets presets
  static const EdgeInsets cardPadding = EdgeInsets.all(lg); // 16.0
  static const EdgeInsets cardMargin = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: 6.0,
  );
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(horizontal: lg);
  static const EdgeInsets dialogPadding = EdgeInsets.all(xl); // 24.0
}
