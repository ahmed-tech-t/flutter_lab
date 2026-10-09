import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_spacing.dart';

/// App-wide common decorations and styles.
abstract class AppDecorations {
  /// Translucent rounded container decoration used for cards and tiles across the app.
  static BoxDecoration cardDecoration({
    BorderRadius? borderRadius,
    Color? borderColor,
    Color? fillColor,
  }) {
    return BoxDecoration(
      color: fillColor ?? Colors.white.withAlpha(20),
      borderRadius: borderRadius ?? BorderRadius.circular(AppSpacing.md),
      border: Border.all(
        color: borderColor ?? Colors.white.withAlpha(50),
        width: 1.0,
      ),
    );
  }

  /// Consistent InputDecoration for text inputs across all forms in the app.
  static InputDecoration inputDecoration({
    String? hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.white.withAlpha(120)),
      filled: true,
      fillColor: Colors.white.withAlpha(20),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSpacing.md),
        borderSide: BorderSide(color: Colors.white.withAlpha(50)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSpacing.md),
        borderSide: BorderSide(color: Colors.white.withAlpha(50)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSpacing.md),
        borderSide: const BorderSide(
          color: Colors.blueAccent,
          width: 1.5,
        ),
      ),
    );
  }
}

