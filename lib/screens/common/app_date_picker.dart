import 'package:flutter/material.dart';

/// Reusable helper for displaying a styled date picker consistent with the app's dark theme.
class AppDatePicker {
  AppDatePicker._();

  /// Opens a themed date picker dialog and returns the selected [DateTime], or null if dismissed.
  static Future<DateTime?> pickDate(
    BuildContext context, {
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    final now = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: initialDate ?? now,
      firstDate: firstDate ?? DateTime(2020),
      lastDate: lastDate ?? DateTime(2035),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Colors.blueAccent,
              surface: Color.fromARGB(255, 26, 14, 74),
              onSurface: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );
  }
}

